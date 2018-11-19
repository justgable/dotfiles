#!/bin/bash
# Returns the value of the battery charge on MacOS
pmset -g batt | grep -E "[0-9]{2,3}%" | awk 'NR==1{print$3}' | cut -c 1-3
