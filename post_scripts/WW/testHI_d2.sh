NPROCESS=6
for i in ./*; 
do tslice $i/HI.out -f 2001 -t 2010 -o $i/HI_mean_d2.out;
done

for ((i=1; i<=8640; i++)); 
do sed "$i"'q;d' ../param_samples.dat > tempHI; 
seq 20 | xargs -Inone cat tempHI > tempHI1;
sed -n -e 2,21p $i/HI_mean_d2.out > tempHI2;
paste tempHI1 tempHI2 >"$i"'/paramHI_2_'"$i"'.out';
done
cat */paramHI_2_*.out > tempHI2_3
echo -e "Num SLA CN_min CN_range senNrate senCrate k_N N_dem_re SLA CN_min CN_range senNrate senCrate k_N N_dem_re Lon Lat TeWW TeSW TeWWi TeSWi TeWstd" | cat - tempHI2_3 > HI_d2.out;


~

~

