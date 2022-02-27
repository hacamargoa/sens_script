awk '{if(NR==1){print "Lon","Lat","Year","TeSW","TeWW","TeSWstd"} else {print $1,$2,1980,0,0,1;print $1,$2,1981,"0.5","0.5",0}}' $1 > lucrop_teww.dat

