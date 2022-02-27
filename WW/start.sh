NPROCESS=6
for ((a=1; a <= NPROCESS ; a++))
do
  cd run$a
  nohup bash runmod.sh > Q&
  cd ..
done
