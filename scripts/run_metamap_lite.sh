#!/bin/bash

. ./environment.sh

set -x

export JAVA_TOOL_OPTIONS='-Xms2G -Xmx6G -XX:MinHeapFreeRatio=25 -XX:+UseG1GC'

pushd $DATA_IN
touch files
ls -d -1 "$PWD/"*.txt > files
popd

pushd $METAMAPLITE_HOME
$METAMAPLITE_HOME/metamaplite.sh --filelistfn=$DATA_IN/files
mv $DATA_IN/*.mmi $METAMAPLITE_OUT/
popd

pushd $METAMAPLITE_OUT
for f in $METAMAPLITE_OUT/*.mmi; do
  mv -- "$f" "${f%.mmi}.txt"
done
popd

set +x

