#!/bin/bash

#1 copy lab_setup directory inside your $PROJECT_ROOT directory.

source ./.docker/setEnvVar.sh

# for testing uncomment these files
#echo $LAB_1234_ROOT
#echo $LAB_1234_COMPOSE_FILE
#echo $LAB_1234_ENV_FILE
#echo $LAB_1234_LOG_FILE
#echo $LAB_1234_ROOT/$CMD_SCRIPTS_DIR
#exit

#2 hidden mode. change permissions to read only. can not delete
chmod 755 -R $DOCKER_DIR_NAME  $CMD_SCRIPTS_DIR  $CODE_DIR_NAME $XAMPP_DIR_NAME

#3 copy dir(code) to dir $PROJECT_ROOT directory.
cp -R "$LAB_1234_ROOT/$CODE_DIR_NAME"  "$(dirname "$LAB_1234_ROOT")"/code
chmod 777 -R "$(dirname "$LAB_1234_ROOT")"/code

#4 export environment variables inside the $HOME/.bashrc file
if ! grep -q "$LAB_1234_ENV_FILE" "$HOME/.bashrc"; then
	echo " " >> $HOME/.bashrc
	echo "# following line is added for cse lab setup using docker">> $HOME/.bashrc
	echo "source $LAB_1234_ENV_FILE" >> $HOME/.bashrc
fi

#5 export environment variables inside the $HOME/.profile file
if ! grep -q "$LAB_1234_ENV_FILE" "$HOME/.profile"; then
	echo " " >> $HOME/.profile
	echo "# following line is added for cse lab setup using docker">> $HOME/.profile
	echo "source $LAB_1234_ENV_FILE" >> $HOME/.profile
fi

#6 copy XAMPP desktop file to Desktop
cp $LAB_1234_ROOT/$XAMPP_DIR_NAME/$XAMPP_DESKTOP_FILE  $HOME/Desktop/$XAMPP_DESKTOP_FILE

#7 hidden mode. change permissions to read only. can not delete
chmod 555 -R $DOCKER_DIR_NAME  $CMD_SCRIPTS_DIR  $CODE_DIR_NAME $XAMPP_DIR_NAME

#8 change the exports inside the file command_scripts/main
