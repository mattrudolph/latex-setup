#!/bin/bash

name=$1
title=$2
month=${3-1}
day=${4-1}
year=${5-11}
force=$6

months=([1]=January [2]=February [3]=March [4]=April [5]=May [6]=June [7]=July [8]=August [9]=September [10]=October [11]=November [12]=December)

echo "Creating new presentation in directory $name"
echo "Title = $title"
echo "Date = ${months[$month]} $day 20$year"


if [ -d $name ]; then
    echo Directory exists
    if [ $force = 1 ]; then
	echo Deleting...
	rm -r $name
    else
	echo Exiting
	exit 1
    fi
fi

mkdir $name
cp -r ~/mrudolph/texmf/tex/latex/local/prestemplate/* $name/
echo "sed -e 's/XXTITLEXX/$title/' -e s/XXMONTHXX/$month/ -e s/XXMONTHTXTXX/${months[$month]}/ -e s/XXDAYXX/$day/ -e s/XXYEARXX/$year/ $name/template.tex > $name/${name}.tex"
sed -e "s/XXTITLEXX/$title/" \
    -e s/XXMONTHXX/$month/ \
    -e s/XXMONTHTXTXX/${months[$month]}/ \
    -e s/XXDAYXX/$day/ \
    -e s/XXYEARXX/$year/ $name/template.tex > $name/${name}.tex
rm $name/template.tex*
