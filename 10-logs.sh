#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILES="/tmp/$0-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ...$R FAILED $N"
        exit 1
    else
        echo -e "$2 .... $G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo "ERROR:: you are not a root user"
    exit 1 
else
    echo "you are a root user"
fi

yum install mysql -y&>> $LOG_FILES

VALIDATE $? "Installing MYSQL" 

yum install git -y &>> $LOG_FILES

VALIDATE $? "Installing GIT" 