NPROCESS=6
for i in ./*; 
do tslice $i/al_cmass.out -f 2001 -t 2010 -o $i/alcmass_mean_d2.out;
done

for ((i=1; i<=8640; i++)); 
do sed "$i"'q;d' ../param_samples.dat > tempalcmass; 
seq 22 | xargs -Inone cat tempalcmass > tempalcmass1;
sed -n -e 2,23p $i/alcmass_mean_d2.out > tempalcmass2;
paste tempalcmass1 tempalcmass2 >"$i"'/paramalcmass_2_'"$i"'.out';
done
cat */paramalcmass_2_*.out > tempalcmass2_3
echo -e "Num SLA CN_min CN_range senNrate senCrate k_N N_dem_re Lon Lat TeCS TeCG TeCSi TeCGi TeCostd" | cat - tempalcmass2_3 > alcmass_d2.out;


~

~

