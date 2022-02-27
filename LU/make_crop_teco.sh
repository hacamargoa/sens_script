awk '{if(NR==1){print "Lon","Lat","Year","TeCS","TeCG","TeCOstd"} else {print $1,$2,1980,0,0,1;print $1,$2,1981,"0.5","0.5",0}}' $1 > lucrop_teco.dat

