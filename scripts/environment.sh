#!/bin/bash

#General Config
export TOOLS_HOME=/usr/local/nlp_tools
export SHARE_NAME=data
export DATA_DIRECTORY=$TOOLS_HOME/host_data
export DATA_IN=$DATA_DIRECTORY/data_in
export RANDOM_SAMPLE=50
export SAMPLE_FILE=$DATA_DIRECTORY/nlptab_manifest.txt

#NLP-ADAPT
export NLP_ADAPT_HOME=$TOOLS_HOME/nlp-adapt
export ADAPT_CONFIG=$NLP_ADAPT_HOME/config
export AMICUS_CONFIG=$ADAPT_CONFIG/amicus
export BIOMEDICUS_CONFIG=$ADAPT_CONFIG/biomedicus
export CLAMP_CONFIG=$ADAPT_CONFIG/clamp
export METAMAP_CONFIG=$ADAPT_CONFIG/metamap
export ADAPT_SCRIPTS=$NLP_ADAPT_HOME/scripts

#UIMA
export UIMA_HOME=$TOOLS_HOME/apache-uima

#CLAMP
export CLAMP_HOME=$TOOLS_HOME/ClampCmd_1.6.3
export CLAMP_OUT=$DATA_DIRECTORY/clamp_out

#cTAKES
export CTAKES_HOME=$TOOLS_HOME/apache-ctakes-4.0.0
# source $ADAPT_SCRIPTS/umls.sh
export CTAKES_OUT=$DATA_DIRECTORY/ctakes_out

#METAMAP
export METAMAP_HOME=$TOOLS_HOME/metamap_2020/public_mm
export PATH=$TOOLS_HOME/metamap_2020/public_mm/bin:$PATH
export METAMAP_OUT=$DATA_DIRECTORY/metamap_out

#METAMAPLITE
export METAMAPLITE_HOME=$TOOLS_HOME/metamap_lite_2020/public_mm_lite
export PATH=$TOOLS_HOME/metamap_lite_2020/public_mm_lite/bin:$PATH
export METAMAPLITE_OUT=$DATA_DIRECTORY/metamap_lite_out

#BIOMEDICUS
export BIOMEDICUS_HOME=$TOOLS_HOME/biomedicus
export BIOMEDICUS_CONF=$TOOLS_HOME/biomedicus/config
export BIOMEDICUS_OUT=$DATA_DIRECTORY/biomedicus_out

#AMICUS
export AMICUS_HOME=$TOOLS_HOME/amicus
export AMICUS_OUT=$DATA_DIRECTORY/amicus_out
