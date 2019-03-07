#!/bin/sh

set -e

if [ -n "$OUTPUT_FILE" ]
then
  sh -c "jq $* > $OUTPUT_FILE" 
else
  sh -c "jq $*"
fi
