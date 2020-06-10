rm $AMICUS_HOME/TypeSystems/*
cp $AMICUS_CONFIG/AmicusTypeSystem.xml $AMICUS_HOME/TypeSystems/AmicusTypeSystem.xml

#BioMedICUS
cp $BIOMEDICUS_OUT/TypeSystem.xml $AMICUS_HOME/TypeSystems/BiomedICUSTypeSystem.xml

#cTAKES
cp $CTAKES_OUT/TypeSystem.xml $AMICUS_HOME/TypeSystems/cTAKESTypeSystem.xml

#MetaMap
cp $METAMAP_OUT/TypeSystem.xml $AMICUS_HOME/TypeSystems/MetaMapTypeSystem.xml

# CLAMP
cp $CLAMP_OUT/TypeSystem.xml $AMICUS_HOME/TypeSystems/TypeSystem.xml

# --- BUILD ---
pushd $AMICUS_HOME
./build.sh
popd

# --- RUN ---
if [ -f $TOOLS_HOME/nlp_adapt/export.yml ]; then
    java -jar $AMICUS_HOME/amicus.jar $TOOLS_HOME/nlp_adapt/export.yml
else
    java -jar $AMICUS_HOME/amicus.jar $AMICUS_CONFIG/merge_concepts.yml
fi

##### Create Archive for NLP-TAB #####
if [ ! -f $SAMPLE_FILE ]; then
    ls $DATA_IN | shuf -n $RANDOM_SAMPLE | sed 's/\.txt/\.txt\.xmi/' > $SAMPLE_FILE
    echo "TypeSystem.xml" >> $SAMPLE_FILE
fi
pushd $AMICUS_OUT
zip $AMICUS_OUT -@ < $SAMPLE_FILE
popd

AMICUS_META='{"systemName":"Amicus", "systemDescription":"Amicus merged annotations", "instance":"default"}'

RESPONSE=$(echo $AMICUS_META | curl -sS -d @- http://localhost:9200/_nlptab-systemindexmeta)
curl -sS --data-binary @$AMICUS_OUT.zip -H 'Content-Type: application/zip' "http://localhost:9200/_nlptab-systemindex?instance=default&index=$(echo $RESPONSE | jq -r .index)&useXCas=false"
