NPROCESS=6
for i in ./*; 
do tslice $i/lai.out -f 2001 -t 2010 -o $i/lai_mean_d2.out;
done

for ((i=1; i<=8640; i++)); 
do sed "$i"'q;d' ../param_samples.dat > templai; 
seq 22 | xargs -Inone cat templai > templai1;
sed -n -e 2,23p $i/lai_mean_d2.out > templai2;
paste templai1 templai2 >"$i"'/paramlai_2_'"$i"'.out';
done
cat */paramlai_2_*.out > templai2_3
echo -e "Num SLA CN_min CN_range senNrate senCrate k_N N_dem_re Lon Lat TeCS TeCG TeCSi TeCGi TeCostd" | cat - templai2_3 > lai_d2.out;


~

~

