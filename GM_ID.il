;====================== Set to XL mode =========================================
ocnSetXLMode()
ocnxlProjectDir( "/home/saul/projects/FIL3601/Sim" )
ocnxlTargetCellView( "DAY2" "GM_ID" "adexl" )
ocnxlResultsLocation( "" )
ocnxlSimResultsLocation( "" )
ocnxlMaxJobFail( 20 )

;====================== Tests setup ============================================

;---------- Test "DAY2:GM_ID:1" ------------- 
ocnxlBeginTest("DAY2:GM_ID:1")
simulator( 'spectre )
design( "DAY2" "GM_ID" "schematic")

load("SCRIPTS/day2/models.il")
load("SCRIPTS/day2/global.il")

analysis('dc ?saveOppoint t  )
desVar(	  "IDS" IDS1	)
desVar(	  "L" L1	)
desVar(	  "NF" NF1	)
desVar(	  "VDS" VDS1	)
desVar(	  "WF" WF1	)
envOption(
	'analysisOrder  list("dc" "pz" "dcmatch" "stb" "tran" "envlp" "ac" "lf" "noise" "xf" "sp" "pss" "pac" "pstb" "pnoise" "pxf" "psp" "qpss" "qpac" "qpnoise" "qpxf" "qpsp" "hb" "hbac" "hbstb" "hbnoise" "hbxf" "sens" "acmatch") 
)
temp( 27 ) 
ocnxlEndTest() ; "DAY2:GM_ID:1"

;====================== Sweeps setup ===========================================
ocnxlSweepVar("IDS" "{From/To}Decade:10n:10:10m{From/To}")
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



gm = pv("M0.m1" "gm" ?result "dcOpInfo")
id = pv("M0.m1" "id" ?result "dcOpInfo")
cgs = mag(pv("M0.m1" "cgs" ?result "dcOpInfo"))
cgd = mag(pv("M0.m1" "cgd" ?result "dcOpInfo"))
cgb = mag(pv("M0.m1" "cgb" ?result "dcOpInfo"))

gm_id = gm/id

newWindow
plot( gm_id ?expr '( "gm_id" ) )

newWindow
ft = (gm/(cgs + cgd + cgb))/(2*3.14159265)
plot( ft ?expr '( "ft" ) )
