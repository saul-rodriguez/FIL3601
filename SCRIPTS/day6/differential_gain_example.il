simulator( 'spectre )
/*ADDED ONLY FOR DOCKER STARTS HERE*/
hostMode( 'distributed )
/*ADDED ONLY FOR DOCKER ENDS HERE*/


design("DAY6" "ex2" "schematic")
createNetlist

resultsDir( "/home/saul/projects/FIL3601/Sim/ex2/spectre/schematic" )

/*
modelFile( 
    '("/pkg/xfab2/XKIT/xh018/cadence/v9_0/spectre/v9_0_2/lpmos/config.scs" "default")
    '("/pkg/xfab2/XKIT/xh018/cadence/v9_0/spectre/v9_0_2/lpmos/param.scs" "3s")
    '("/pkg/xfab2/XKIT/xh018/cadence/v9_0/spectre/v9_0_2/lpmos/bip.scs" "tm")
    '("/pkg/xfab2/XKIT/xh018/cadence/v9_0/spectre/v9_0_2/lpmos/cap.scs" "tm")
    '("/pkg/xfab2/XKIT/xh018/cadence/v9_0/spectre/v9_0_2/lpmos/dio.scs" "tm")
    '("/pkg/xfab2/XKIT/xh018/cadence/v9_0/spectre/v9_0_2/lpmos/mos.scs" "tm")
    '("/pkg/xfab2/XKIT/xh018/cadence/v9_0/spectre/v9_0_2/lpmos/photo.scs" "tm")
    '("/pkg/xfab2/XKIT/xh018/cadence/v9_0/spectre/v9_0_2/lpmos/res.scs" "tm")
)
*/


load("SCRIPTS/lab1/models.il")

analysis('tran ?stop "6m"  ?errpreset "conservative"  )
analysis('dc ?saveOppoint t  ?param "VIN2"  ?start "-0.9"  
		?stop "0.9"  ?step "1m"  )
desVar(	  "VIN2" 0	)
envOption(
	'analysisOrder  list("dc" "tran") 
)
temp( 27 ) 
;run()

/*ADDED ONLY FOR DOCKER STARTS HERE*/
jobList = nil

; starting first job
jobList = append1( jobList run( ?host "edatools" ) )

; wait for all the jobs to complete
wait((append1 last(jobList) nil))

/*ADDED ONLY FOR DOCKER ENDS HERE*/

selectResult( 'dc )

gain = deriv(VS("/VOUT2"))

GQ = value(deriv(VS("/VOUT2")) 0   )
GP = value(deriv(VS("/VOUT2")) 10m   )
GN = value(deriv(VS("/VOUT2")) -10m   )

ep = (GQ - GP)/GQ
em = (GQ - GN)/GQ

d2 = mag((ep-em)/8)
d2_dB = dB20(d2)

d3 = mag((ep+em)/24)
d3_dB = dB20(d3)

printf("************************\n")
printf("Static Gain Simulation\n")
printf("d2_dB = %4.2f dB\n" d2_dB)
printf("d3_dB = %4.2f dB\n" d3_dB)

newWindow
plot(gain)

selectResult( 'tran )
newWindow
plot(getData("/VOUT"))

