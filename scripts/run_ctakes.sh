#!/bin/bash
set -x

. ./environment.sh

##### Run cTAKES #####
mkdir -p $CTAKES_OUT
. $ADAPT_SCRIPTS/umls.sh
$CTAKES_HOME/bin/runClinicalPipeline.sh -i $DATA_IN -o $CTAKES_OUT

set +x
