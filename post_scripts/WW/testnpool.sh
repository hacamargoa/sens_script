NPROCESS=6
for i in ./*; 
do tslice $i/npool.out -f 1980 -t 1989 -o $i/npool_mean_d2.out;
done

for ((i=1; i<=8640; i++)); 
do sed "$i"'q;d' ../param_samples.dat > tempnpool; 
seq 20 | xargs -Inone cat tempnpool > tempnpool1;
sed -n -e 2,21p $i/npool_mean_d2.out > tempnpool2;
paste tempnpool1 tempnpool2 >"$i"'/paramnpool_2_'"$i"'.out';
done
cat */paramnpool_2_*.out > tempnpool2_3
echo -e "Num SLA CN_min CN_range senNrate senCrate k_N N_dem_re SLA CN_min CN_range senNrate senCrate k_N N_dem_re Lon Lat VegN LitterN SoilN HarvSlowN Total" | cat - tempnpool2_3 > npool_d2.out;


~

~

