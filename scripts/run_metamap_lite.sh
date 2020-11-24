#!/bin/bash

. ./environment.sh

set -x

export JAVA_TOOL_OPTIONS='-Xms2G -Xmx6G -XX:MinHeapFreeRatio=25 -XX:+UseG1GC'

pushd $DATA_IN
touch files
ls -d -1 "$PWD/"*.txt > files
popd

pushd $METAMAPLITE_HOME
$METAMAPLITE_HOME/metamaplite.sh --list_acronyms --list_sentences_postags --filelistfn=$DATA_IN/files
popd

set +x

