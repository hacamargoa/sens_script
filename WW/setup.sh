VARIABLE_LIST_FILENAME=params.dat
VARIABLE_LIST_FILENAME_SAMPLE=param_samples.dat
# In global_mod.ins the parameter value should be replaced with 
INSFILE=tmplt.inz
NPROCESS=6
STEPS=4

function split_variable_list {
    # Create empty gridlists first to make sure each run gets one
    for ((a=1; a <= NPROCESS ; a++)) 
    do
      echo > run$a/$VARIABLE_LIST_FILENAME_SAMPLE
    done

    # Figure out suitable number of lines per sample file 
    local lines_per_run=$(wc -l $VARIABLE_LIST_FILENAME_SAMPLE | \
	awk '{ x = $1/'$NPROCESS'; d = (x == int(x)) ? x : int(x)+1; print d}')
	
    # Use the split command to split the files into temporary files
    split --suffix-length=4 --lines $lines_per_run $VARIABLE_LIST_FILENAME_SAMPLE tmpSPLITVARS_

    # Move the temporary files into the runX-directories
    local files=$(ls tmpSPLITVARS_*)
    local i=1
    for file in $files
    do
      mv $file run$i/$VARIABLE_LIST_FILENAME_SAMPLE
      cp $VARIABLE_LIST_FILENAME run$i/$VARIABLE_LIST_FILENAME
      cp mod_runmod.sh run$i/runmod.sh
      #Catalogue X should be a fully working folder containing:
      # - guess
      # - guess.ins
      # - gridlist.txt, etc. 
      cp X/* run$i
      #cp $INSFILE run$i/$INSFILE
      i=$((i+1))
    done
}

for ((a=1; a <= NPROCESS ; a++))
do
  mkdir -p run$a
  cd run$a ; rm -f * ; cd ..
done
DIR=$(pwd)

#Will create a uniform
#bash create_param_file.sh $VARIABLE_LIST_FILENAME $STEPS > $VARIABLE_LIST_FILENAME_SAMPLE

split_variable_list

mkdir -p results
