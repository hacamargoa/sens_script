NPROCESS=6
for i in ./*; 
do tslice $i/dead_lai.out -f 2001 -t 2010 -o $i/dlai_mean_d2.out;
done

for ((i=1; i<=8640; i++)); 
do sed "$i"'q;d' ../param_samples.dat > tempdlai; 
seq 20 | xargs -Inone cat tempdlai > tempdlai1;
sed -n -e 2,21p $i/dlai_mean_d2.out > tempdlai2;
paste tempdlai1 tempdlai2 >"$i"'/paramdlai_2_'"$i"'.out';
done
cat */paramdlai_2_*.out > tempdlai2_3
echo -e "Num SLA CN_min CN_range senNrate senCrate k_N N_dem_re SLA CN_min CN_range senNrate senCrate k_N N_dem_re Lon Lat TeWW TeSW TeWWi TeSWi TeWstd" | cat - tempdlai2_3 > dlai_d2.out;


~

~

