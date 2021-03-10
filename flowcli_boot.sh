#!/bin/sh
FILE=flow.json
if test -f "$FILE"; then
    echo "$FILE exists."
else
    flow project init
fi
sleep 1d