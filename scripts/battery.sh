#!/bin/bash
# Returns the value of the battery charge on MacOS
BATT="$(pmset -g batt | grep -E "[0-9]{2,3}%" | awk 'NR==1{print$3}' | sed 's/%;$//')"

FULL=""
TQTR=""
HALF=""
OQTR=""
EMPTY=""

if [ "$BATT" -ge 91 ]; then
  echo "$FULL $FULL $FULL $FULL $FULL"
elif [[  "$BATT" -ge 81 && "$BATT" -lt 91 ]]; then
  echo "$FULL $FULL $FULL $FULL $HALF"
elif [[  "$BATT" -ge 71 && "$BATT" -lt 81 ]]; then
  echo "$FULL $FULL $FULL $FULL $EMPTY"
elif [[ "$BATT" -ge 61 && "$BATT" -lt 71 ]]; then
  echo "$FULL $FULL $FULL $HALF $EMPTY"
elif [[ "$BATT" -ge 51 && "$BATT" -lt 61 ]]; then
  echo "$FULL $FULL $FULL $EMPTY $EMPTY"
elif [[ "$BATT" -ge 41 && "$BATT" -lt 51 ]]; then
  echo "$FULL $FULL $HALF $EMPTY $EMPTY"
elif [[ "$BATT" -ge 31 && "$BATT" -lt 41 ]]; then
  echo "$FULL $FULL $EMPTY $EMPTY $EMPTY"
elif [[ "$BATT" -ge 21 && "$BATT" -lt 31 ]]; then
  echo "$FULL $HALF $EMPTY $EMPTY $EMPTY"
elif [[ "$BATT" -ge 11 && "$BATT" -lt 21 ]]; then
  echo "$FULL $EMPTY $EMPTY $EMPTY $EMPTY"
elif [[ "$BATT" -ge 1 && "$BATT" -lt 11 ]]; then
  echo "$HALF $EMPTY $EMPTY $EMPTY $EMPTY"
fi
