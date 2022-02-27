NPROCESS=6
for i in ./*; 
do tslice $i/anpp.out -f 2001 -t 2010 -o $i/anpp_mean_d2.out;
done

for ((i=1; i<=8640; i++)); 
do sed "$i"'q;d' ../param_samples.dat > tempanpp; 
seq 22 | xargs -Inone cat tempanpp > tempanpp1;
sed -n -e 2,23p $i/anpp_mean_d2.out > tempanpp2;
paste tempanpp1 tempanpp2 >"$i"'/paramanpp_2_'"$i"'.out';
done
cat */paramanpp_2_*.out > tempanpp2_3
echo -e "Num SLA CN_min CN_range senNrate senCrate k_N N_dem_re Lon Lat TeCS TeCG TeCSi TeCGi TeCostd total total1" | cat - tempanpp2_3 > anpp_d2.out;


~

~

