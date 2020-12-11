#!/bin/bash

#Define the string value
src1=$1;
src2=$2;
des=$3;
builddir=$4;
#now=$(date +%Y%m%d%H%M%S)
cfg_out=$builddir/HBM_tmp.cfg1

# Set space as the delimiter
IFS='_'

echo " LLL $SRC1 "
echo " LLL $cfg_out "
echo " LLL $builddir "

echo "[connectivity]" > HBM_tmp.cfg
#echo "[connectivity]" >> $cfg_out

#Read the split words into an array based on space delimiter
read -a strarr <<< $1

#Count the total words
#echo "There are ${#strarr[*]} words in the text."

# Print each value of the array by using the loop
if [ ${#strarr[*]} -gt 1 ]
then
  echo "sp=vadd_1.in1:HBM[${strarr[0]}:${strarr[1]}]" >> HBM_tmp.cfg
else 
  echo "sp=vadd_1.in1:HBM[${strarr[0]}]" >> HBM_tmp.cfg
fi
#Read the split words into an array based on space delimiter
read -a strarr <<< "$2"

# Print each value of the array by using the loop
if [ ${#strarr[*]} -gt 1 ]
then
  echo "sp=vadd_1.in2:HBM[${strarr[0]}:${strarr[1]}]" >> HBM_tmp.cfg
else 
  echo "sp=vadd_1.in2:HBM[${strarr[0]}]" >> HBM_tmp.cfg
fi

#Read the split words into an array based on space delimiter
read -a strarr <<< "$3"
# Print each value of the array by using the loop
if [ ${#strarr[*]} -gt 1 ]
then
  echo "sp=vadd_1.out:HBM[${strarr[0]}:${strarr[1]}]" >> HBM_tmp.cfg
else 
  echo "sp=vadd_1.out:HBM[${strarr[0]}]" >> HBM_tmp.cfg
fi
