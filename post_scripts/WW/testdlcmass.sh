NPROCESS=6
for i in ./*; 
do tslice $i/dl_cmass.out -f 2001 -t 2010 -o $i/dlcmass_mean_d2.out;
done

for ((i=1; i<=8640; i++)); 
do sed "$i"'q;d' ../param_samples.dat > tempdlcmass; 
seq 20 | xargs -Inone cat tempdlcmass > tempdlcmass1;
sed -n -e 2,21p $i/dlcmass_mean_d2.out > tempdlcmass2;
paste tempdlcmass1 tempdlcmass2 >"$i"'/paramdlcmass_2_'"$i"'.out';
done
cat */paramdlcmass_2_*.out > tempdlcmass2_3
echo -e "Num SLA CN_min CN_range senNrate senCrate k_N N_dem_re SLA CN_min CN_range senNrate senCrate k_N N_dem_re Lon Lat TeWW TeSW TeWWi TeSWi TeWstd" | cat - tempdlcmass2_3 > dlcmass_d2.out;


~

~

