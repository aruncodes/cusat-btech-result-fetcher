#!/bin/bash

# Automated result fetcher from CUSAT result site.
# Script written by Arun Babu, March 2012, arun.aspirant@gmail.com, zyberkiddy@yahoo.com
# 1st parameter should be starting register number eg:12101000
# 2nd parameter should be no of roll numbers preceeding it
# Example usage: $ ./result.sh 12101000 47
# Above example fetches result of reg nos from 12101000 to 12101047


semester="V" 			# use capital roman letters denoting semester
exam="Regular"			# Regular or Supplimentry
date="NOVEMBER 2011"		# Month followed by year, all in capital letters

# Do not change anything after this point
degree="B.Tech"
url="http://results.cusat.ac.in/regforms/mrklst-main.php"
filename="mrklst-main.php"
logfile="log.txt"
startrollnumber=$1
limit=$2

# $i=0
for (( i=0; i < limit; i++)) do
	let "regno=$startrollnumber+$i"
	echo -n "Fetching result of $regno....."
	wget -a $logfile --post-data="rno=$regno&reg=R&degree=$degree&sem=$semester&exam=$exam&edate=$date" $url
	echo "completed."
	mv $filename $regno.html
done

echo "Finished. Now check current directory for results.. Thank you"
