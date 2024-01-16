#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILES="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 ...FAILED"
        exit 1
    else
        echo "$2 ....SUCCESS"
    fi
}

if [ $ID -ne 0 ]
then
    echo "ERROR:: you are not a root user"
    exit 1 
else
    echo "you are a root user"
fi

yum install mysql -y

VALIDATE $? "Installing MYSQL" &>> $LOG_FILES

yum install git -y

VALIDATE $? "Installing GIT" &>> $LOG_FILES