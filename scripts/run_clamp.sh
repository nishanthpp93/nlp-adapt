#!/bin/bash

set -x

. ./environment.sh

##### Run CLAMP #####
. $ADAPT_SCRIPTS/umls.sh
mkdir -p $CLAMP_OUT
$CLAMP_CONFIG/run_nlpie_pipeline.sh
