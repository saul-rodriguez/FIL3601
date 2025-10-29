;====================== Set to XL mode =========================================
ocnSetXLMode()
ocnxlProjectDir( "./Sim" )
ocnxlTargetCellView( "LAB1" "FT" "adexl" )
ocnxlResultsLocation( "" )
ocnxlSimResultsLocation( "" )
ocnxlMaxJobFail( 20 )

;====================== Tests setup ============================================

;---------- Test "DAY2:FT:1" ------------- 
ocnxlBeginTest("DAY2:FT:1")
simulator( 'spectre )
design( "LAB1" "FT" "schematic")

load("SCRIPTS/day2/models.il")
load("SCRIPTS/day2/global.il")

analysis('ac ?start "0.01"  ?stop "100G"  )
desVar(	  "IDS" IDS1	)
desVar(	  "L" L1	)
desVar(	  "NF" NF1	)
desVar(	  "VDS" VDS1	)
desVar(	  "WF" WF1	)
envOption(
	'analysisOrder  list("ac" "pz" "dcmatch" "stb" "tran" "envlp" "dc" "lf" "noise" "xf" "sp" "pss" "pac" "pstb" "pnoise" "pxf" "psp" "qpss" "qpac" "qpnoise" "qpxf" "qpsp" "hb" "hbac" "hbstb" "hbnoise" "hbxf" "sens" "acmatch") 
)
save( 'i "/IPRB0/MINUS" )
temp( 27 ) 
ocnxlOutputTerminal( "/IPRB0/MINUS" ?plot t ?save t)
ocnxlEndTest() ; "DAY2:FT:1"

;====================== Sweeps setup ===========================================
ocnxlSweepVar("L" "L1")
ocnxlSweepVar("NF" "NF1")
ocnxlSweepVar("VDS" "VDS1")
ocnxlSweepVar("WF" "WF1")
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
	"distributionmethod" "Remote-Host"
	"jobruntype" "ICRP"
	"estimatecpuvalue" ""
	"estimatememoryvalue" ""
	"jobhostname" "b35621b5a0f6"
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

Ai = dB20(i("/IPRB0/MINUS" ?result "ac"))
FT = cross( Ai 0 1 'falling)

newWindow
plot( FT )
