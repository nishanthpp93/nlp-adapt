#!/bin/bash

. ./environment.sh

set -x

export JAVA_TOOL_OPTIONS='-Xms2G -Xmx6G -XX:MinHeapFreeRatio=25 -XX:+UseG1GC'

for file in $DATA_IN; do
$METAMAPLITE_HOME/metamaplite.sh --pipe < $file
done

set +x

