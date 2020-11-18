#!/bin/bash

. ./environment.sh

set -x

export JAVA_TOOL_OPTIONS='-Xms2G -Xmx6G -XX:MinHeapFreeRatio=25 -XX:+UseG1GC'

pushd $METAMAPLITE_HOME
for file in $DATA_IN/*.txt; do
file_base_name=$(basename "${file}")
file_name=${file_base_name%.*}
cat "$file" | $METAMAPLITE_HOME/metamaplite.sh --pipe > $METAMAPLITE_OUT/"$file_name".csv
done
popd

set +x

