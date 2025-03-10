simulator( 'spectre )
;design(	 "/home/saul/projects/FIL3601/Sim/BIAS_NMOS/spectre/schematic/netlist/netlist")
design( "DAY2" "BIAS_NMOS" "schematic")
createNetlist
resultsDir( "/home/saul/projects/FIL3601/Sim/BIAS_NMOS/spectre/schematic" )

load("SCRIPTS/day2/models.il")
load("SCRIPTS/day2/global.il")

analysis('dc ?saveOppoint t  )
desVar(	  "L" L1	)
desVar(	  "NF" NF1	)
desVar(	  "VDS" VDS1	)
desVar(	  "VGS" 0.4	)
desVar(	  "WF" WF1	)
envOption(
	'analysisOrder  list("dc") 
)
temp( 27 ) 
run()
cgs = mag(pv("M0.m1" "cgs" ?result "dcOpInfo"))
cgd = mag(pv("M0.m1" "cgd" ?result "dcOpInfo"))
cgb = mag(pv("M0.m1" "cgb" ?result "dcOpInfo"))
gm = pv("M0.m1" "gm" ?result "dcOpInfo")
gds = pv("M0.m1" "gds" ?result "dcOpInfo")
id = pv("M0.m1" "id" ?result "dcOpInfo")

rds = 1/gds
ft = (gm/(cgs + cgd + cgb))/(2*3.141592)

gm_id = gm/id

;plot( CGS ?expr '( "CGS" ) )
printf("*********************************\n")
printf("Value of cgs = %4.5f [fF]\n" cgs*1e15)
printf("Value of cgb = %4.5f [fF]\n" cgb*1e15)
printf("Value of cgd = %4.5f [fF]\n" cgd*1e15)
printf("Value of gm = %4.5f [mS]\n" gm*1e3)
printf("Value of rds = %4.5f [Ohm]\n" rds)
printf("Value of ft = %4.5f [GHz]\n" ft/1e9)
printf("Value of gm_id = %4.5f \n" gm_id)
printf("*********************************\n")




