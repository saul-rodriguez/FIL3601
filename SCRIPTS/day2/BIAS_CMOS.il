simulator( 'spectre )
design(	 "/home/saul/projects/FIL3601/Sim/SELF_CMOS/spectre/schematic/netlist/netlist")
resultsDir( "/home/saul/projects/FIL3601/Sim/SELF_CMOS/spectre/schematic" )
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
analysis('dc ?saveOppoint t  )
desVar(	  "IDSP" 1u	)
desVar(	  "LP" 0.5u	)
desVar(	  "NFP" 2	)
desVar(	  "VDSP" 0.5	)
desVar(	  "WFP" 20u	)
desVar(	  "IDS" 10u	)
desVar(	  "L" 180n	)
desVar(	  "NF" 1	)
desVar(	  "VDS" 0.9	)
desVar(	  "WF" 8u	)
envOption(
	'firstRun  nil 
	'analysisOrder  list("dc") 
)
temp( 27 ) 
run()
