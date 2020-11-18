#!/bin/bash

. ./environment.sh

set -x

##### Run BiomedICUS #####
$BIOMEDICUS_HOME/bin/runCPE.sh $BIOMEDICUS_CONFIG/PlainTextCPM_nlpie.xml

set +x
