#!/bin/bash

. ./environment.sh

set -x

##### Stop Metamap Tagger Servers #####
skrmedpostctl stop
wsdserverctl stop

set +x

