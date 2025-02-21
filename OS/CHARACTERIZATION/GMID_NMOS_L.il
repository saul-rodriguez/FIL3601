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

load("OS/CHARACTERIZATION/global.il")
load("OS/CHARACTERIZATION/models.il")

L = L1
NF = NF1
VDS = VDS1
WF = WF1

analysis('dc ?saveOppoint t  ?saveopinfinal t  ?save "all"  )
desVar(	  "IDS1" IDS1	)
desVar(	  "L1" L1	)
desVar(	  "NF1" NF1	)
desVar(	  "VDS1" VDS1	)
desVar(	  "WF1" WF1	)
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
ocnxlSweepVar("L1" "L")
ocnxlSweepVar("NF1" "NF")
ocnxlSweepVar("VDS1" "VDS")
ocnxlSweepVar("WF1" "WF")

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


gm = pv("I0.M0.m1" "gm" ?result "dcOpInfo")
id = pv("I0.M0.m1" "id" ?result "dcOpInfo")
cgs = mag(pv("I0.M0.m1" "cgs" ?result "dcOpInfo"))
cgd = mag(pv("I0.M0.m1" "cgd" ?result "dcOpInfo"))
cgb = mag(pv("I0.M0.m1" "cgb" ?result "dcOpInfo"))

gm_id = gm/id

newWindow
plot( gm_id ?expr '( "gm_id" ) )

newWindow
ft = (gm/(cgs + cgd + cgb))/(2*3.14159265)
plot( ft ?expr '( "ft" ) )
