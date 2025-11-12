simulator( 'spectre )
/*ADDED ONLY FOR DOCKER STARTS HERE*/
hostMode( 'distributed )
/*ADDED ONLY FOR DOCKER ENDS HERE*/

;design(	 "/home/saul/projects/FIL3601/Sim/NOISE_NMOS/spectre/schematic/netlist/netlist")
design("LAB2" "NOISE_NMOS" "schematic")
createNetlist

resultsDir( "/home/saul/projects/FIL3601/Sim/NOISE_NMOS/spectre/schematic" )
modelFile( 
    '("/opt/pdk/xfab/XKIT/xh018/cadence/v10_0/spectre/v10_0_2/lpmos/config.scs" "default")
    '("/opt/pdk/xfab/XKIT/xh018/cadence/v10_0/spectre/v10_0_2/lpmos/param.scs" "3s")
    '("/opt/pdk/xfab/XKIT/xh018/cadence/v10_0/spectre/v10_0_2/lpmos/bip.scs" "tm")
    '("/opt/pdk/xfab/XKIT/xh018/cadence/v10_0/spectre/v10_0_2/lpmos/cap.scs" "tm")
    '("/opt/pdk/xfab/XKIT/xh018/cadence/v10_0/spectre/v10_0_2/lpmos/dio.scs" "tm")
    '("/opt/pdk/xfab/XKIT/xh018/cadence/v10_0/spectre/v10_0_2/lpmos/mos.scs" "tm")
    '("/opt/pdk/xfab/XKIT/xh018/cadence/v10_0/spectre/v10_0_2/lpmos/photo.scs" "tm")
    '("/opt/pdk/xfab/XKIT/xh018/cadence/v10_0/spectre/v10_0_2/lpmos/res.scs" "tm")
)
analysis('noise ?start "0.01"  ?stop "100G"  ?dec "20"  
		?oprobe "/IPRB1"  ?iprobe "/V2"  )

load("SCRIPTS/lab1/models.il")
load("SCRIPTS/lab1/global.il")


desVar(	  "IDS" IDS1	)
desVar(	  "L" L1	)
desVar(	  "NF" NF1	)
desVar(	  "VDS" VDS1	)
desVar(	  "WF" WF1	)
envOption(
	'firstRun  t 
	'analysisOrder  list("noise") 
)
temp( 27 ) 

/*ADDED ONLY FOR DOCKER STARTS HERE*/
;run()
jobList = nil

; starting first job
jobList = append1( jobList run( ?host "edatools" ) )

; wait for all the jobs to complete
wait((append1 last(jobList) nil))

/*ADDED ONLY FOR DOCKER ENDS HERE*/



input\ noise\;\ A\ \/\ sqrt\(Hz\) = getData("in" ?result "noise")
plot( input\ noise\;\ A\ \/\ sqrt\(Hz\) ?expr '( "input noise; A / sqrt(Hz)" ) )
