#!/bin/bash

# Disable Screen Sharing

# Check for the Casper casperscreensharing user

check=$( dscl . -list /Users | grep casperscreensharing )

if [ "$check" != "" ];
then
	exit 0
fi

# Kill the service

/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -configure -access -off
