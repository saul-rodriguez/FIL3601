;====================== Set to XL mode =========================================
ocnSetXLMode()
ocnxlProjectDir( "./Sim" )
ocnxlTargetCellView( "DAY2" "FT" "adexl" )
ocnxlResultsLocation( "" )
ocnxlSimResultsLocation( "" )
ocnxlMaxJobFail( 20 )

;====================== Tests setup ============================================

;---------- Test "DAY2:FT:1" ------------- 
ocnxlBeginTest("DAY2:FT:1")
simulator( 'spectre )
design( "DAY2" "FT" "schematic")
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
analysis('ac ?start "0.1"  ?stop "100G"  ?dec "20"  )
desVar(	  "IDS" 10u	)
desVar(	  "L" 180n	)
desVar(	  "NF" 1	)
desVar(	  "VDS" 0.9	)
desVar(	  "WF" 10u	)
envOption(
	'analysisOrder  list("ac" "pz" "dcmatch" "stb" "tran" "envlp" "dc" "lf" "noise" "xf" "sp" "pss" "pac" "pstb" "pnoise" "pxf" "psp" "qpss" "qpac" "qpnoise" "qpxf" "qpsp" "hb" "hbac" "hbstb" "hbnoise" "hbxf" "sens" "acmatch") 
)
save( 'i "/IPRB0/MINUS" )
temp( 27 ) 
ocnxlOutputTerminal( "/IPRB0/MINUS" ?plot t ?save t)
ocnxlOutputExpr( "cross(mag(IF(\"/IPRB0/MINUS\")) \"1\" 1 \"falling\" nil nil nil)" ?name "ft" ?plot t ?evalType 'point)
ocnxlEndTest() ; "DAY2:FT:1"

;====================== Sweeps setup ===========================================
ocnxlSweepVar("L" "180n")
ocnxlSweepVar("NF" "1")
ocnxlSweepVar("VDS" "0.9")
ocnxlSweepVar("WF" "10u")
ocnxlSweepVar("IDS" "{From/To}Decade:100n:10:10m{From/To}")

;====================== Model Group setup ==========================================

;====================== Corners setup ==========================================

;====================== Checks and Asserts setup ============================================
ocnxlPutChecksAsserts(?netlist nil)

;====================== Job setup ==============================================
ocnxlJobSetup( '(
	"blockemail" "1"
	"communicationtimeout" "-1"
	"configuretimeout" "300"
	"distributionmethod" "Local"
	"jobruntype" "ICRP"
	"estimatecpuvalue" ""
	"estimatememoryvalue" ""
	"lingertimeout" "300"
	"maxjobs" "10"
	"name" "ADE XL Default"
	"preemptivestart" "1"
	"reconfigureimmediately" "1"
	"runtimeout" "-1"
	"showerrorwhenretrying" "1"
	"showoutputlogerror" "0"
	"startmaxjobsimmed" "1"
	"starttimeout" "300"
	"usesameprocess" "1"
) )

;====================== Disabled items =========================================

;====================== Run Mode Options ======================================

;====================== Starting Point Info ======================================

;====================== Run command ============================================
ocnxlRun( ?mode 'sweepsAndCorners ?nominalCornerEnabled t ?allCornersEnabled t ?allSweepsEnabled t)
ocnxlOutputSummary(?exprSummary t ?specSummary t ?detailed t ?wave t)
ocnxlOpenResults()

;====================== End XL Mode command ===================================
ocnxlEndXLMode()
