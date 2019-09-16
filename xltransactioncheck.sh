#!/bin/bash

#Get ccid list file
echo "Enter the ccid list file name which contains all ccid's(eg. ccidlist.txt):"
read ccidlist

#Get log file
echo "Enter the log file name(eg. wso2carbon.log.2019-08-24.gz):"
read logfile

#Get output file
echo "Enter the output file name(eg. Batch1-Output.xlsx):"
read outputfile

#ccid count
number=$(sed -n '$=' $ccidlist)

#print all the ccid present in the ccid file
#cat $ccidlist

#Total number of ccid
echo $number

#Grep ccid one by one and check the response status
for value in $(seq $number);
do
	echo $value
	ccid=$(sed -n "${value}p" $ccidlist)
        response1="Request has been execute successfully"
        response2="Insufficient Balance"
	echo "ccid is $ccid"
	echo $ccid  >> xltran.txt
	status=$(zgrep $ccid $logfile | zgrep  'Response from XL' | sed -e 's/.*responseDesc\(.*\)responseDesc.*/\1/' | sed -e 's/[^a-zA-Z*0-9-]/ /g;s/  */ /g')
	
#check whether status is present in the log for the specific ccid
	if [ -z "$status" ]
	then
		echo "CCID Not Present"  >> xltran.txt
	else
		echo  $status >> xltran.txt	
	fi
#Print Charged or Not Charged according to the response status
	case $status in
		*$response1*)
			echo "Charged" >> xltran.txt
			;;
		*$response2*)
			echo "Not Charged" >> xltran.txt
			;;
		"")
			echo "No Status" >> xltran.txt
			;;
		*)
			echo $status >> xltran.txt
			;;
	esac
done

#move the final result to a excel sheet
awk '{printf "%s%s",$0,NR%3?"\t":RS}' xltran.txt  > $outputfile

rm xltran.txt
exit 0
