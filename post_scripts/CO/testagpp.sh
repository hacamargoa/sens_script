NPROCESS=6
for i in ./*; 
do tslice $i/agpp.out -f 2001 -t 2010 -o $i/agpp_mean_d2.out;
done

for ((i=1; i<=8640; i++)); 
do sed "$i"'q;d' ../param_samples.dat > tempagpp; 
seq 22 | xargs -Inone cat tempagpp > tempagpp1;
sed -n -e 2,23p $i/agpp_mean_d2.out > tempagpp2;
paste tempagpp1 tempagpp2 >"$i"'/paramagpp_2_'"$i"'.out';
done
cat */paramagpp_2_*.out > tempagpp2_3
echo -e "Num SLA CN_min CN_range senNrate senCrate k_N N_dem_re Lon Lat TeCS TeCG TeCSi TeCGi TeCostd total total1" | cat - tempagpp2_3 > agpp_d2.out;


~

~

