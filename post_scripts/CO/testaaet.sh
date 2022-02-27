NPROCESS=6
for i in ./*; 
do tslice $i/aaet.out -f 2001 -t 2010 -o $i/aaet_mean_d2.out;
done

for ((i=1; i<=8640; i++)); 
do sed "$i"'q;d' ../param_samples.dat > tempaaet; 
seq 22 | xargs -Inone cat tempaaet > tempaaet1;
sed -n -e 2,23p $i/aaet_mean_d2.out > tempaaet2;
paste tempaaet1 tempaaet2 >"$i"'/paramaaet_2_'"$i"'.out';
done
cat */paramaaet_2_*.out > tempaaet2_3
echo -e "Num SLA CN_min CN_range senNrate senCrate k_N N_dem_re Lon Lat TeCS TeCG TeCSi TeCGi TeCostd total total1" | cat - tempaaet2_3 > aaet_d2.out;


~

~

