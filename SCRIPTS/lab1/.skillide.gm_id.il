;====================== Set to XL mode =========================================
ocnSetXLMode()
ocnxlProjectDir( "./Sim" )
ocnxlTargetCellView( "LAB1" "GM_ID" "adexl" )
ocnxlResultsLocation( "" )
ocnxlSimResultsLocation( "" )
ocnxlMaxJobFail( 20 )

;====================== Tests setup ============================================

;---------- Test "DAY2:GM_ID:1" ------------- 
ocnxlBeginTest("DAY2:GM_ID:1")
simulator( 'spectre )
design( "LAB1" "GM_ID" "schematic")
createNetlist

load("SCRIPTS/lab1/models.il")
load("SCRIPTS/lab1/global.il")


analysis('dc ?saveOppoint t  )
;desVar(	  "IDS" 100u	)
;desVar(	  "L" 1u	)
;desVar(	  "NF" 10	)
;desVar(	  "VDS" 0.9	)
;desVar(	  "WF" 8u	)
desVar(	  "IDS" IDS1	)
desVar(	  "L" L1	)
desVar(	  "NF" NF1	)
desVar(	  "VDS" VDS1	)
desVar(	  "WF" WF1	)
envOption(
	'analysisOrder  list("dc" "pz" "dcmatch" "stb" "tran" "envlp" "ac" "lf" "noise" "xf" "sp" "pss" "pac" "pstb" "pnoise" "pxf" "psp" "qpss" "qpac" "qpnoise" "qpxf" "qpsp" "hb" "hbac" "hbstb" "hbnoise" "hbxf" "sens" "acmatch") 
)
temp( 27 ) 
ocnxlOutputExpr( "pv(\"M0.m1\" \"gm\" ?result \"dcOpInfo\")" ?name "gm" ?plot t ?evalType 'point)
ocnxlEndTest() ; "DAY2:GM_ID:1"

;====================== Sweeps setup ===========================================
ocnxlSweepVar("IDS" "{From/To}Decade:1n:10:500u{From/To}")
;ocnxlSweepVar("L" "1u")
;ocnxlSweepVar("NF" "10")
;ocnxlSweepVar("VDS" "0.9")
;ocnxlSweepVar("WF" "8u")
ocnxlSweepVar("L" "L1")
ocnxlSweepVar("NF" "NF1")
ocnxlSweepVar("VDS" "VDS1")
ocnxlSweepVar("WF" "WF1")

;====================== Model Group setup ==========================================

;====================== Corners setup ==========================================

;====================== Checks and Asserts setup ============================================
ocnxlPutChecksAsserts(?netlist nil)

;====================== Job setup ==============================================
ocnxlJobSetup( '(
	"blockemail" "1"
	"communicationtimeout" "-1"
	"configuretimeout" "300"
	"distributionmethod" "Remote-Host"
	"jobruntype" "ICRP"
	"estimatecpuvalue" ""
	"estimatememoryvalue" ""
	"jobhostname" "edatools"
	"lingertimeout" "300"
	"maxjobs" "8"
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

gm = pv("M0.m1" "gm" ?result "dcOpInfo")
gds = pv("M0.m1" "gds" ?result "dcOpInfo")
ids = pv("M0.m1" "ids" ?result "dcOpInfo")
cgs = mag(pv("M0.m1" "cgs" ?result "dcOpInfo"))
cgd = mag(pv("M0.m1" "cgd" ?result "dcOpInfo"))
cgb = mag(pv("M0.m1" "cgb" ?result "dcOpInfo"))

gm_id = gm/ids
ft = (gm/(cgs + cgd + cgb))/(2*3.141592)
rds = 1/gds
av = gm*rds

newWindow
plot( gm_id ?expr '( "gm_id" ) )
plot( ft ?expr '( "ft" ) )
plot( gm ?expr '( "gm" ) )
plot( av ?expr '( "av" ) )

