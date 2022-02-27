NPROCESS=3
for i in ./*; 
do tslice $i/yield.out -f 2001 -t 2010 -o $i/yield_mean_d2.out;
done

for ((i=1; i<=8640; i++)); 
do sed "$i"'q;d' ../param_samples.dat > temp; 
seq 22 | xargs -Inone cat temp > temp1;
sed -n -e 2,23p $i/yield_mean_d2.out > temp2;
paste temp1 temp2 >"$i"'/param_2_'"$i"'.out';
done
cat */param_2_*.out > temp2_3
echo -e "Num SLA CN_min CN_range senNrate senCrate k_N N_dem_re Lon Lat TeCS TeCG TeCSi TeCGi TeCostd" | cat - temp2_3 > yield_d2.out;
