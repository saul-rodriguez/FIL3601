simulator( 'spectre )
/*ADDED ONLY FOR DOCKER STARTS HERE*/
hostMode( 'distributed )
/*ADDED ONLY FOR DOCKER ENDS HERE*/

;design(	 "/home/saul/projects/FIL3601/Sim/NOISE_NMOS/spectre/schematic/netlist/netlist")

design("DAY5" "NOISE_NMOS" "schematic")
createNetlist

resultsDir( "/home/saul/projects/FIL3601/Sim/NOISE_NMOS/spectre/schematic" )


load("SCRIPTS/day2/models.il")
load("SCRIPTS/day2/global.il")

analysis('noise ?start "0.01"  ?stop "100G"  ?dec "20"  
		?oprobe "/IPRB1"  ?iprobe "/V2"  )
desVar(	  "IDS" IDS1	)
desVar(	  "L" L1)
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
jobList = append1( jobList run( ?host "950e82c38b16" ) )

; wait for all the jobs to complete
wait((append1 last(jobList) nil))

/*ADDED ONLY FOR DOCKER ENDS HERE*/

input_noise = getData("in" ?result "noise")
plot( input_noise ?expr '( "input noise; V / sqrt(Hz)" ) )
