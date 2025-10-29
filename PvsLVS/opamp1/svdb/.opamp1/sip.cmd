sip -V -cgnd 2 -s -o -sub 2 -mlc MET4,METTP -n 25 -i 0,25.001 -b \
	METTP,MET4,MET3,MET2,MET1,POLY1,active,sub -j 3 -Maxw 45 -p \
	METTPL,key 0,25 - METTPL.sip
sip -V -cgnd 2 -s -o -sub 2 -cp POLY1,GateLayers,active -n 2.5 -i \
	0,2.501 -b active,sub -t MET1,MET2,MET3,MET4,METTP,METTPL -j 0.18 \
	-Maxw 2.7 -p POLY1,key 0,2.5 - POLY1.sip
sip -V -cgnd 2 -s -o -sub 2 -mlc POLY1 -n 2.3 -i 0,2.301 -b \
	POLY1,active,sub -t MET2,MET3,MET4,METTP,METTPL -j 0.23 -Maxw 3.45 -p \
	MET1,key 0,2.3 - MET1.sip
sip -V -cgnd 2 -s -o -sub 2 -mlc POLY1,MET1 -n 2.8 -i 0,2.801 -b \
	MET1,POLY1,active,sub -t MET3,MET4,METTP,METTPL -j 0.28 -Maxw 4.2 -p \
	MET2,key 0,2.8 - MET2.sip
sip -V -cgnd 2 -s -o -sub 2 -mlc MET1,MET2 -n 5.6 -i 0,5.601 -b \
	MET2,MET1,POLY1,active,sub -t MET4,METTP,METTPL -j 0.28 -Maxw 4.2 -p \
	MET3,key 0,5.6 - MET3.sip
sip -V -cgnd 2 -s -o -sub 2 -mlc MET2,MET3 -n 5.6 -i 0,5.601 -b \
	MET3,MET2,MET1,POLY1,active,sub -t METTP,METTPL -j 0.28 -Maxw 4.2 -p \
	MET4,key 0,5.6 - MET4.sip
sip -V -cgnd 2 -s -o -sub 2 -mlc MET3,MET4 -n 9.2 -i 0,9.201 -b \
	MET4,MET3,MET2,MET1,POLY1,active,sub -t METTPL -j 0.44 -Maxw 6.6 -p \
	METTP,key 0,9.2 - METTP.sip
sip -V -s -cgnd 2 -sub 2 -L3A -h -b \
	MET4,MET3,MET2,MET1,POLY1,active,sub -Maxw 45 -p \
	METTP:METTP_cut,key,METTPL,key 0,25,0 - METTP_METTPL.sip
sip -V -s -cgnd 2 -sub 2 -L3A -h -R METTPL -b \
	MET3,MET2,MET1,POLY1,active,sub -k METTP:0.985 -Maxw 45 -p \
	MET4:MET4_cut,key,METTPL,key 0,25,0 - MET4_METTPL.sip
sip -V -s -cgnd 2 -sub 2 -h -b MET3,MET2,MET1,POLY1,active,sub -t \
	METTPL -Maxw 6.6 -p MET4:MET4_cut,key,METTP:METTP_cut,key 0,9.2,0 - \
	MET4_METTP.sip
sip -V -s -cgnd 2 -sub 2 -L3A -h -R METTP -b \
	MET2,MET1,POLY1,active,sub -t METTPL -k MET4:0.565 -Maxw 6.6 -p \
	MET3:MET3_cut,key,METTP:METTP_cut,key 0,9.2,0 - MET3_METTP.sip
sip -V -s -cgnd 2 -sub 2 -h -b MET2,MET1,POLY1,active,sub -t \
	METTP,METTPL -Maxw 4.2 -p MET3:MET3_cut,key,MET4:MET4_cut,key 0,5.6,0 \
	- MET3_MET4.sip
sip -V -s -cgnd 2 -sub 2 -L3A -h -R MET4 -b MET1,POLY1,active,sub \
	-t METTP,METTPL -k MET3:0.565 -Maxw 4.2 -p \
	MET2:MET2_cut,key,MET4:MET4_cut,key 0,5.6,0 - MET2_MET4.sip
sip -V -s -cgnd 2 -sub 2 -h -b MET1,POLY1,active,sub -t \
	MET4,METTP,METTPL -Maxw 4.2 -p MET2:MET2_cut,key,MET3:MET3_cut,key \
	0,5.6,0 - MET2_MET3.sip
sip -V -s -cgnd 2 -sub 2 -L3A -h -R MET3 -b POLY1,active,sub -t \
	MET4,METTP,METTPL -k MET2:0.565 -Maxw 4.2 -p \
	MET1:MET1_cut,key,MET3:MET3_cut,key 0,5.6,0 - MET1_MET3.sip
sip -V -s -cgnd 2 -sub 2 -h -b POLY1,active,sub -t \
	MET3,MET4,METTP,METTPL -Maxw 4.2 -p \
	MET1:MET1_cut,key,MET2:MET2_cut,key 0,2.8,0 - MET1_MET2.sip
sip -V -s -cgnd 2 -sub 2 -L3A -h -R MET2 -b active,sub -t \
	MET3,MET4,METTP,METTPL -k MET1:0.565 -Maxw 4.2 -p \
	POLY1:POLY1_cut,key,MET2:MET2_cut,key 0,2.8,0 - POLY1_MET2.sip
sip -V -s -cgnd 2 -sub 2 -h -R MET1,POLY1 -b active,sub -t \
	MET2,MET3,MET4,METTP,METTPL -Maxw 3.45 -p \
	POLY1:POLY1_cut,key,MET1:MET1_cut,key 0,2.5,0 - POLY1_MET1.sip
sw3d -V -cgnd 2 -sub 2 -b MET4,MET3,MET2,MET1,POLY1,active,sub -p \
	METTP:METTP_cut,METTPL - METTP_METTPL.sw3d
sw3d -V -cgnd 2 -sub 2 -b MET3,MET2,MET1,POLY1,active,sub -t \
	METTPL -p MET4:MET4_cut,METTP:METTP_cut - MET4_METTP.sw3d
sw3d -V -cgnd 2 -sub 2 -b MET2,MET1,POLY1,active,sub -t \
	METTP,METTPL -p MET3:MET3_cut,MET4:MET4_cut - MET3_MET4.sw3d
sw3d -V -cgnd 2 -sub 2 -b MET1,POLY1,active,sub -t \
	MET4,METTP,METTPL -p MET2:MET2_cut,MET3:MET3_cut - MET2_MET3.sw3d
sw3d -V -cgnd 2 -sub 2 -b POLY1,active,sub -t \
	MET3,MET4,METTP,METTPL -p MET1:MET1_cut,MET2:MET2_cut - \
	MET1_MET2.sw3d
sw3d -V -cgnd 2 -sub 2 -b active,sub -t \
	MET2,MET3,MET4,METTP,METTPL -p POLY1:POLY1_cut,MET1:MET1_cut - \
	POLY1_MET1.sw3d
