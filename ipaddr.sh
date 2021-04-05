#!/bin/bash

set -e

VERSION=0.4-1

# Dependencies: curl

# Copyright (C) 2020 Pontus Falk

# MIT License

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

VAR0=$(basename "$0")
VAR1=$(ip address | grep 'dynamic noprefixroute wlp1s0' | awk '{print $2}')
VAR1bis=${VAR1%/*}
VAR2=$(ip route | grep default | awk '{print $3}')
VAR3=$(ip address | grep 'dynamic noprefixroute wlp1s0' | awk '{print $4}')
VAR4=$(curl -s https://am.i.mullvad.net/connected | awk '{print $7}')
VAR4bis=${VAR4%)*}

echo "$VAR0 version $VERSION - Copyright (C) 2020 by Pontus Falk"
echo "License: MIT License"
echo
if [ -n "$VAR1bis" ]; then
   echo "    IP address: $VAR1bis"
   echo "       Gateway: $VAR2"
   echo "  Bcst address: $VAR3"
   echo
   if [ -n "$VAR4bis" ]; then
      echo "Mullvad server: $VAR4bis"
      echo
   else
      echo "*** You are not connected to Mullvad VPN (https://mullvad.net)!"
      echo
   fi
else
   echo "*** You don't have any network connection!"
   echo
fi
echo "Done!"
