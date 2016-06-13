#!/bin/bash

# Set Network Proxy information

searchNetwork="$4"
ProxyAddress="$5"

# Let's check to see if we've been passed the Search Domain details in field 5 & 6.

if [ "$searchNetwork" == "" ]; then
	echo "Error:  No network service name in parameter 4 was specified."
	exit 1
fi

if [ "$ProxyAddress" == "" ]; then
	echo "Error:  No proxy address in parameter 5 was specified."
	exit 1
fi

OLDIFS=$IFS
IFS=$'\n'

NetServiceArray=($( networksetup -listallnetworkservices | grep $searchNetwork ))
 
IFS=$OLDIFS
 
arraylength=${#NetServiceArray[@]}
 
for (( loop=0; loop<${arraylength}; loop++ ));
do
	networksetup -setautoproxyurl "${NetServiceArray[$loop]}" $ProxyAddress
done

echo "Setting complete"