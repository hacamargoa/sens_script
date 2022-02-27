NPROCESS=6
for i in ./*; 
do tslice $i/CtoN_ho.out -f 2001 -t 2010 -o $i/CtoN_mean_d2.out;
done

for ((i=1; i<=8640; i++)); 
do sed "$i"'q;d' ../param_samples.dat > tempCtoN; 
seq 20 | xargs -Inone cat tempCtoN > tempCtoN1;
sed -n -e 2,21p $i/CtoN_mean_d2.out > tempCtoN2;
paste tempCtoN1 tempCtoN2 >"$i"'/paramCtoN_2_'"$i"'.out';
done
cat */paramCtoN_2_*.out > tempCtoN2_3
echo -e "Num SLA CN_min CN_range senNrate senCrate k_N N_dem_re SLA CN_min CN_range senNrate senCrate k_N N_dem_re Lon Lat TeWW TeSW TeWWi TeSWi TeWstd" | cat - tempCtoN2_3 > CtoN_d2.out;


~

~

