#!/bin/bash

# Script to remove com.apple.quarantine setting from a specific app in /Applications
# Using $4 from Casper to specify the app to process.

App="$4"

if [ "$App" == "" ]; then
	echo "Error:  No application name in parameter 4 was specified."
	exit 1
fi

xattr -r -d com.apple.quarantine /Applications/$App
