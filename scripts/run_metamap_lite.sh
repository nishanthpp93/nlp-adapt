#!/bin/bash

. ./environment.sh

set -x

export JAVA_TOOL_OPTIONS='-Xms2G -Xmx6G -XX:MinHeapFreeRatio=25 -XX:+UseG1GC'

pushd $METAMAPLITE_HOME
for file in $DATA_IN/*.txt; do
cat $file | $METAMAPLITE_HOME/metamaplite.sh --pipe
done
popd

set +x

