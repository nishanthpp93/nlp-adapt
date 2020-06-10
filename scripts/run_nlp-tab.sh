#sudo update-rc.d elasticsearch defaults 95 10
#sudo /etc/init.d/elasticsearch start

cd $TOOLS_HOME/nlptab-webapp
gulp webserver
