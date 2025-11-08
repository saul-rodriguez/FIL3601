simulator( 'spectre )
hostMode( 'distributed )

design("DAY2" "SELF_CMOS" "schematic")
createNetlist

resultsDir( "/home/saul/projects/FIL3601/Sim/SELF_CMOS/spectre/schematic" )

load("SCRIPTS/day2/models.il")
load("SCRIPTS/day2/global.il")


analysis('dc ?saveOppoint t  )
desVar(	  "IDSP" IDS4	)
desVar(	  "LP" L4	)
desVar(	  "NFP" NF4	)
desVar(	  "VDSP" VDS4	)
desVar(	  "WFP" WF4	)
desVar(	  "IDS" IDS1	)
desVar(	  "L" L1	)
desVar(	  "NF" NF1	)
desVar(	  "VDS" VDS1	)
desVar(	  "WF" WF1	)
envOption(
	'analysisOrder  list("dc") 
)
temp( 27 ) 
;run()

jobList = nil

; starting first job
jobList = append1( jobList run( ?host "950e82c38b16" ) )

; wait for all the jobs to complete
wait((append1 last(jobList) nil))


cgs1 = 1e15*mag(pv("M0.m1" "cgs" ?result "dcOpInfo"))
cgd1 = 1e15*mag(pv("M0.m1" "cgd" ?result "dcOpInfo"))
cgb1 = 1e15*mag(pv("M0.m1" "cgb" ?result "dcOpInfo"))
cds1 = 1e15*mag(pv("M0.m1" "cds" ?result "dcOpInfo"))
cdb1 = 1e15*mag(pv("M0.m1" "cdb" ?result "dcOpInfo"))
vgs1 = mag(pv("M0.m1" "vgs" ?result "dcOpInfo"))
gm1 = pv("M0.m1" "gm" ?result "dcOpInfo")
gds1 = pv("M0.m1" "gds" ?result "dcOpInfo")
id1 = pv("M0.m1" "id" ?result "dcOpInfo")

rds1 = 1/gds1
G1 = gm1*rds1
gm_id1 = gm1/id1
ft1 = gm1/(2*3.1415927*(cgs1+cgd1+cgb1))*1e15/1e6 ;Ft in MHz

cgs4 = 1e15*mag(pv("M1.m1" "cgs" ?result "dcOpInfo"))
cgd4 = 1e15*mag(pv("M1.m1" "cgd" ?result "dcOpInfo"))
cgb4 = 1e15*mag(pv("M1.m1" "cgb" ?result "dcOpInfo"))
cds4 = 1e15*mag(pv("M1.m1" "cds" ?result "dcOpInfo"))
cdb4 = 1e15*mag(pv("M1.m1" "cdb" ?result "dcOpInfo"))
vgs4 = mag(pv("M1.m1" "vgs" ?result "dcOpInfo"))
gm4 = pv("M1.m1" "gm" ?result "dcOpInfo")
gds4 = pv("M1.m1" "gds" ?result "dcOpInfo")
id4 = mag(pv("M1.m1" "id" ?result "dcOpInfo"))

rds4 = 1/gds4
G4 = gm4*rds4
gm_id4 = gm4/id4
ft4 = gm4/(2*3.1415927*(cgs4+cgd4+cgb4))*1e15/1e6 ;Ft in MHz


printf(";NMOS1 parameters:\n L1 = %4.2fu\n W1 = %4.2fu\n NF1 = %d\n IDS1 = %6.5fm\n VDS1 = %4.2f\n VGS1 = %4.5f\n\n" 1e6*L1 1e6*WF1 NF1 1e3*IDS1 VDS1 vgs1)
printf("NMOS1: W1_tot = %4.2fum  L1 = %4.2fum  IDS1 = %6.5fmA  VDS1 = %4.2fV\n" 1e6*(WF1*NF1) 1e6*L1 1e3*IDS1 VDS1)
printf("  gm1 = %5.4fm\n  rds1 = %4.2f\n  cgs1 = %4.2ff\n  cgb1 = %4.2ff\n  cgd1 = %4.2ff\n  cds1 = %4.2ff\n  cdb1 = %4.2ff\n  vgs1 = %5.4f\n  Gain1 = %4.2f\n" 1e3*gm1 rds1 cgs1 cgb1 cgd1 cds1 cdb1 vgs1 G1)
printf("  gm_id1 = %4.2f\n  Ft1 = %4.2f MHz \n\n" gm_id1 ft1)

printf(";PMOS4 parameters:\n L4 = %4.2fu\n W4 = %4.2fu\n NF4 = %d\n IDS4 = %6.5fm\n VDS4 = %4.2f\n VGS4 = %4.5f\n\n" 1e6*L4 1e6*WF4 NF4 1e3*IDS4 VDS4 vgs4)
printf("PMOS4: W4_tot = %4.2fum  L4 = %4.2fum  IDS4 = %6.5fmA  VDS4 = %4.2fV\n" 1e6*(WF4*NF4) 1e6*L4 1e3*IDS4 VDS4)
printf("  gm4 = %5.4fm\n  rds4 = %4.2f\n  cgs4 = %4.2ff\n  cgb4 = %4.2ff\n  cgd4 = %4.2ff\n  cds4 = %4.2ff\n  cdb4 = %4.2ff\n  vgs4 = %5.4f\n  Gain4 = %4.2f\n" 1e3*gm4 rds4 cgs4 cgb4 cgd4 cds4 cdb4 vgs4 G4)
printf("  gm_id4 = %4.2f\n  Ft4 = %4.2f MHz \n\n" gm_id4 ft4)






