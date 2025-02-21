;====================== Set to XL mode =========================================
ocnSetXLMode()
ocnxlProjectDir( "/home/saul/projects/FIL3601/Sim" )
ocnxlTargetCellView( "CHARACTERIZATION" "FT" "adexl" )
ocnxlResultsLocation( "" )
ocnxlSimResultsLocation( "" )
ocnxlMaxJobFail( 20 )

;====================== Tests setup ============================================

;---------- Test "CHARACTERIZATION:FT:1" ------------- 
ocnxlBeginTest("CHARACTERIZATION:FT:1")
simulator( 'spectre )
design( "CHARACTERIZATION" "FT" "schematic")
load("OS/CHARACTERIZATION/models.il")
load("OS/CHARACTERIZATION/global.il")

L = L1
NF = NF1
VDSA = VDS1
WF = WF1

analysis('ac ?start "1"  ?stop "100G"  ?dec "10"  )
analysis('dc ?saveOppoint t  )
desVar(	  "IDS" IDS1	)
desVar(	  "VDS" VDS1	)
desVar(	  "IDS1" IDS1	)
desVar(	  "L" L1	)
desVar(	  "NF" NF1	)
desVar(	  "VDS1" VDS1	)
desVar(	  "WF" WF1	)
envOption(
	'analysisOrder  list("dc" "ac" "pz" "dcmatch" "stb" "tran" "envlp" "lf" "noise" "xf" "sp" "pss" "pac" "pstb" "pnoise" "pxf" "psp" "qpss" "qpac" "qpnoise" "qpxf" "qpsp" "hb" "hbac" "hbstb" "hbnoise" "hbxf" "sens" "acmatch") 
	'stopViewList  list("spectre" "veriloga" "ahdl") 
	'switchViewList  list("spectre" "veriloga" "ahdl" "cmos_sch" "schematic") 
)
option(	'limit  "delta" 
	'homotopy  "all" 
	'reltol  "100e-6" 
)
option( ?categ 'turboOpts
	'apsplus  t 
	'uniModeSpectreX  "Spectre" 
)
save( 'i "/IPRB0/MINUS" )
temp( 27 ) 
ocnxlOutputTerminal( "/IPRB0/MINUS" ?plot t ?save t)
ocnxlOutputExpr( "cross(dB20(IF(\"/IPRB0/MINUS\")) \"1\" 1 \"falling\" nil nil nil)" ?plot t ?evalType 'point)
ocnxlEndTest() ; "CHARACTERIZATION:FT:1"

;====================== Sweeps setup ===========================================
ocnxlSweepVar("IDS1" "{From/To}Decade:1u:10:10m{From/To}")
ocnxlSweepVar("L" "L1")
ocnxlSweepVar("NF" "NF1")
ocnxlSweepVar("VDS1" "VDSA")
ocnxlSweepVar("WF" "WF1")
ocnxlSweepVar("IDS" "IDS1")
ocnxlSweepVar("VDS" "VDSA")

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

; ****************************
;        Generate FT
; ****************************

Gain = dB20(i("/IPRB0/MINUS" ?result "ac"))
FT = cross( Gain 0 1 'falling )

newWindow
plot( Gain ?expr '( "Gain" ) )
addSubwindowTitle( "Current Gain vs. Freq" )
addSubwindow()
plot(FT)
addSubwindowTitle( "FT vs. IDS" )
