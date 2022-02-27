NPROCESS=6
for i in ./*; 
do tslice $i/cpool.out -f 1980 -t 1989 -o $i/cpool_mean_d2.out;
done

for ((i=1; i<=8640; i++)); 
do sed "$i"'q;d' ../param_samples.dat > tempcpool; 
seq 22 | xargs -Inone cat tempcpool > tempcpool1;
sed -n -e 2,23p $i/cpool_mean_d2.out > tempcpool2;
paste tempcpool1 tempcpool2 >"$i"'/paramcpool_2_'"$i"'.out';
done
cat */paramcpool_2_*.out > tempcpool2_3
echo -e "Num SLA CN_min CN_range senNrate senCrate k_N N_dem_re Lon Lat VegN LitterN SoilN HarvSlowN Total" | cat - tempcpool2_3 > cpool_d2.out;


~

~

