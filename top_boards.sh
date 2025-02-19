#!/bin/bash

INPUT=$1
ID=$((INPUT - 1))

# Extract estimated length from all investigations
echo
echo "Top Board $INPUT Estimated Length:"
for pallet in data/*.json; do

  # Extract measurement and corresponding recipe result
  MEASUREMENT=`jq ".measurements.Top3dBoardGeometry.TopBoards.[$ID] | .EstimatedLength" $pallet`
  RESULT=`jq -j ".resultCandidates.[0] | .results.TopBoard${INPUT}Length" $pallet`

  # Pretty print
  MLEN=${#MEASUREMENT}
  RLEN=${#RESULT}
  TLEN=$((MLEN + RLEN))
  SLEN=$((30 - TLEN))
  echo -n $MEASUREMENT
  printf '%0.s ' $(seq 1 $SLEN)
  if [[ $RESULT == "Accepted" ]]; then
    COLOR='\033[0;32m'
  else
    COLOR='\033[0;31m'
  fi
  NC='\033[0m'
  echo -e ${COLOR}${RESULT}${NC}

done

# Extract estimated width from all investigations
echo
echo "Top Board $INPUT Estimated Width:"
for pallet in data/*.json; do

  # Extract measurement and corresponding recipe result
  MEASUREMENT=`jq -j ".measurements.Top3dBoardGeometry.TopBoards.[$ID] | .EstimatedWidth" $pallet`
  RESULT=`jq -j ".resultCandidates.[0] | .results.TopBoard${INPUT}Width" $pallet`

  # Pretty print
  MLEN=${#MEASUREMENT}
  RLEN=${#RESULT}
  TLEN=$((MLEN + RLEN))
  SLEN=$((30 - TLEN))
  echo -n $MEASUREMENT
  printf '%0.s ' $(seq 1 $SLEN)
  if [[ $RESULT == "Accepted" ]]; then
    COLOR='\033[0;32m'
  else
    COLOR='\033[0;31m'
  fi
  NC='\033[0m'
  echo -e ${COLOR}${RESULT}${NC}

done

# Extract estimated thickness from all investigations
echo
echo "Top Board $INPUT Estimated Thickness:"
for pallet in data/*.json; do

  # Extract measurement and corresponding recipe result
  MEASUREMENT=`jq ".measurements.Top3dBoardGeometry.TopBoards.[$ID] | .EstimatedHeight" $pallet`
  RESULT=`jq -j ".resultCandidates.[0] | .results.TopBoard${INPUT}Thickness" $pallet`

  # Pretty print
  MLEN=${#MEASUREMENT}
  RLEN=${#RESULT}
  TLEN=$((MLEN + RLEN))
  SLEN=$((30 - TLEN))
  echo -n $MEASUREMENT
  printf '%0.s ' $(seq 1 $SLEN)
  if [[ $RESULT == "Accepted" ]]; then
    COLOR='\033[0;32m'
  else
    COLOR='\033[0;31m'
  fi
  NC='\033[0m'
  echo -e ${COLOR}${RESULT}${NC}
done
echo
