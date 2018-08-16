#!/bin/sh

echo "Please select ..."
  echo 1: Stop CDM server
  echo 2: Stop all server services
  echo 3: Start CDM
  echo 4: Start Tomcat
  echo 5: Start dropbox
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
    1)  sudo /etc/init.d/cdmserver stop	
	break
	;;
    2) 	sudo stop mysql
	sudo /etc/init.d/cdmserver stop
	sudo stop shiny-server
	sudo /etc/init.d/dropbox stop
	sudo teamviewer --daemon stop 
	sudo /home/jansen/tomcat/apache-tomcat-7.0.57/bin/shutdown.sh
	echo " Stopping cdmserver, shiny-server, dropbox, teamviewer and tomcat"
	break
        ;;
    3)	sudo /etc/init.d/dropbox stop
	sudo /home/jansen/tomcat/bin/apache-tomcat-7.0.57/shutdown.sh
	sudo start mysql
	sudo start shiny-server
	sudo /etc/init.d/cdmserver start
	echo " Stopping dropbox and tomcat and starting MySQL, cdmserver and shiny-server"
	break
        ;;
    4) 	sudo stop mysql
	sudo /etc/init.d/cdmserver stop
	sudo stop shiny-server
	sudo /etc/init.d/dropbox stop
	sudo /home/jansen/tomcat/apache-tomcat-7.0.57/bin/startup.sh
	echo " Stopping MySQL, cdmserver and shiny-server and starting dropbox and tomcat"
	firefox --new-tab http://localhost:8081
	break
        ;;
    5)  sudo stop mysql
	sudo /etc/init.d/cdmserver stop
	sudo stop shiny-server
	sudo /etc/init.d/dropbox start
	sudo /home/jansen/tomcat/apache-tomcat-7.0.57/bin/shutdown.sh
	echo " Stopping all services but starting Dropbox"
        break
	;;
  esac
done

# sudo stop # start/stpo davmail
