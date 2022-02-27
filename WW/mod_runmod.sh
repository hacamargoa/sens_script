
VARIABLE_LIST_FILENAME=params.dat
VARIABLE_LIST_FILENAME_SAMPLE=param_samples.dat
#The modified ins-file that 
INSFILE=tmplt.inz
VARS=($(awk '{ print $1 }' $VARIABLE_LIST_FILENAME) )
$(cat $VARIABLE_LIST_FILENAME_SAMPLE > R) 

V=${#VARS[@]}
NRUNS=$(cat $VARIABLE_LIST_FILENAME_SAMPLE | wc -l)

NLINES=$NRUNS

for ((a=0; a < NRUNS ; a++,NLINES--)) 
do
	echo "Nlines $NLINES"
	VALS=($(awk -v l=$a '{ if (NR==l+1) print $0 }' R) )
	cat $INSFILE > tmp
	for ((v=0; v < V ; v++)) 
		do
			let "w=$v+1"
			vr=${VARS[${v}]}
			vl=${VALS[${w}]}
			T="s/$vr/$vl/g"
			sed -e $T tmp>tempo
			mv tempo tmp
	done
	mv tmp crop_n.ins
    #RUN GUESS and put std out in a named file for debugging
    ./guess -input cf guess.ins > simulation.out
    mkdir -p ../results/${VALS[0]}
    
    cp *.out ../results/${VALS[0]}/
    
done
