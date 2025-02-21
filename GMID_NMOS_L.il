;====================== Set to XL mode =========================================
ocnSetXLMode()
ocnxlProjectDir( "./Sim" )
ocnxlTargetCellView( "CHARACTERIZATION" "GMID_NMOS_L" "adexl" )
ocnxlResultsLocation( "" )
ocnxlSimResultsLocation( "" )
ocnxlMaxJobFail( 20 )

;====================== Tests setup ============================================

;---------- Test "CHARACTERIZATION:GMID_NMOS_L:1" ------------- 
ocnxlBeginTest("CHARACTERIZATION:GMID_NMOS_L:1")
simulator( 'spectre )
design( "CHARACTERIZATION" "GMID_NMOS_L" "schematic")
modelFile( 
    '("/pkg/xfab/XKIT/xh018/cadence/v8_0/spectre/v8_0_1/lpmos/config.scs" "default")
    '("/pkg/xfab/XKIT/xh018/cadence/v8_0/spectre/v8_0_1/lpmos/param.scs" "3s")
    '("/pkg/xfab/XKIT/xh018/cadence/v8_0/spectre/v8_0_1/lpmos/bip.scs" "tm")
    '("/pkg/xfab/XKIT/xh018/cadence/v8_0/spectre/v8_0_1/lpmos/cap.scs" "tm")
    '("/pkg/xfab/XKIT/xh018/cadence/v8_0/spectre/v8_0_1/lpmos/dio.scs" "tm")
    '("/pkg/xfab/XKIT/xh018/cadence/v8_0/spectre/v8_0_1/lpmos/mos.scs" "tm")
    '("/pkg/xfab/XKIT/xh018/cadence/v8_0/spectre/v8_0_1/lpmos/photo.scs" "tm")
    '("/pkg/xfab/XKIT/xh018/cadence/v8_0/spectre/v8_0_1/lpmos/res.scs" "tm")
)
analysis('dc ?saveOppoint t  ?saveopinfinal t  ?save "all"  )
desVar(	  "IDS1" 800u	)
desVar(	  "L1" 350n	)
desVar(	  "NF1" 40	)
desVar(	  "VDS1" 0.5	)
desVar(	  "WF1" 10u	)
envOption(
	'firstRun  t 
	'analysisOrder  list("dc" "pz" "dcmatch" "stb" "tran" "envlp" "ac" "lf" "noise" "xf" "sp" "pss" "pac" "pstb" "pnoise" "pxf" "psp" "qpss" "qpac" "qpnoise" "qpxf" "qpsp" "hb" "hbac" "hbstb" "hbnoise" "hbxf" "sens" "acmatch") 
	'stopViewList  list("spectre" "veriloga" "ahdl") 
	'switchViewList  list("spectre" "veriloga" "ahdl" "cmos_sch" "schematic") 
)
option(	'limit  "delta" 
	'homotopy  "all" 
	'reltol  "100e-6" 
)
option( ?categ 'turboOpts
	'uniModeSpectreX  "Spectre" 
	'uniMode  "Spectre" 
)
saveOption( 'save "all" )
temp( 27 ) 
ocnxlOutputExpr( "pv(\"I0.M0.m1\" \"cgs\" ?result \"dcOpInfo\")" ?name "cgs" ?plot t ?evalType 'point)
ocnxlOutputExpr( "pv(\"I0.M0.m1\" \"cgb\" ?result \"dcOpInfo\")" ?name "cgb" ?plot t ?evalType 'point)
ocnxlOutputExpr( "pv(\"I0.M0.m1\" \"gm\" ?result \"dcOpInfo\")" ?name "gm" ?plot t ?evalType 'point)
ocnxlOutputExpr( "pv(\"I0.M0.m1\" \"cgd\" ?result \"dcOpInfo\")" ?name "cgd" ?plot t ?evalType 'point)
ocnxlOutputExpr( "(mag(pv(\"I0.M0.m1\" \"cgs\" ?result \"dcOpInfo\")) + mag(pv(\"I0.M0.m1\" \"cgd\" ?result \"dcOpInfo\")) + mag(pv(\"I0.M0.m1\" \"cgb\" ?result \"dcOpInfo\")))" ?name "Ctot" ?plot t ?evalType 'point)
ocnxlOutputExpr( "(mag(pv(\"I0.M0.m1\" \"gm\" ?result \"dcOpInfo\")) / (mag(pv(\"I0.M0.m1\" \"cgs\" ?result \"dcOpInfo\")) + mag(pv(\"I0.M0.m1\" \"cgd\" ?result \"dcOpInfo\")) + mag(pv(\"I0.M0.m1\" \"cgb\" ?result \"dcOpInfo\"))) / (2 * pi))" ?name "ft" ?plot t ?evalType 'point)
ocnxlOutputExpr( "(pv(\"I0.M0.m1\" \"gm\" ?result \"dcOpInfo\") / pv(\"I0.M0.m1\" \"id\" ?result \"dcOpInfo\"))" ?name "gm_id" ?plot t ?evalType 'point)
ocnxlEndTest() ; "CHARACTERIZATION:GMID_NMOS_L:1"

;====================== Sweeps setup ===========================================
ocnxlSweepVar("IDS1" "{From/To}Decade:10n:10:10000u{From/To}")
ocnxlSweepVar("L1" "180n")
ocnxlSweepVar("NF1" "20")
ocnxlSweepVar("VDS1" "0.9")
ocnxlSweepVar("WF1" "10u")

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
