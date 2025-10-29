simulator( 'spectre )
;design(	 "/home/saul/projects/FIL3601/Sim/SELF_NMOS/spectre/schematic/netlist/netlist")

design("DAY2" "SELF_NMOS" "schematic")
createNetlist

resultsDir( "/home/saul/projects/FIL3601/Sim/SELF_NMOS/spectre/schematic" )

load("SCRIPTS/day2/models.il")
load("SCRIPTS/day2/global.il")


analysis('dc ?saveOppoint t  )
desVar(	  "IDS" IDS1	)
desVar(	  "L" L1	)
desVar(	  "NF" NF1	)
desVar(	  "VDS" VDS1	)
desVar(	  "WF" WF1	)
envOption(
	'analysisOrder  list("dc") 
)
temp( 27 ) 
run()

cgs = 1e15*mag(pv("M0.m1" "cgs" ?result "dcOpInfo"))
cgd = 1e15*mag(pv("M0.m1" "cgd" ?result "dcOpInfo"))
cgb = 1e15*mag(pv("M0.m1" "cgb" ?result "dcOpInfo"))
cds = 1e15*mag(pv("M0.m1" "cds" ?result "dcOpInfo"))
cdb = 1e15*mag(pv("M0.m1" "cdb" ?result "dcOpInfo"))
vgs = mag(pv("M0.m1" "vgs" ?result "dcOpInfo"))
gm = pv("M0.m1" "gm" ?result "dcOpInfo")
gds = pv("M0.m1" "gds" ?result "dcOpInfo")
id = pv("M0.m1" "id" ?result "dcOpInfo")

rds = 1/gds
G1 = gm*rds
gm_id = gm/id
ft = gm/(2*3.1415927*(cgs+cgd+cgb))*1e15/1e6 ;Ft in MHz

printf(";NMOS1 parameters:\n L1 = %4.2fu\n W1 = %4.2fu\n NF1 = %d\n IDS1 = %4.4fm\n VDS1 = %4.2f\n VGS1 = %4.5f\n\n" 1e6*L1 1e6*WF1 NF1 1e3*IDS1 VDS1 vgs)
printf("NMOS1: W1_tot = %4.2fum  L1 = %4.2fum  IDS1 = %4.4fmA  VDS1 = %4.2fV\n" 1e6*(WF1*NF1) 1e6*L1 1e3*IDS1 VDS1)
printf("  gm1 = %4.3fm\n  rds1 = %4.2f\n  cgs1 = %4.2ff\n  cgb1 = %4.2ff\n  cgd1 = %4.2ff\n  cds1 = %4.2ff\n  cdb1 = %4.2ff\n  vgs1 = %5.4f\n  Gain1 = %4.2f\n" 1e3*gm rds cgs cgb cgd cds cdb vgs G1)
printf("  gm_id1 = %4.2f\n  Ft1 = %4.2f MHz \n\n" gm_id ft)






