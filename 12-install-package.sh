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
        echo -e "$2 .... $R FAILED $N"
        exit 1
    else
        echo -e "$2 .... $G SUCcESS $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: Run this script with root user $N"
    exit 1
else
    echo -e "$G You are a root user $N"
fi

for package in $@
do
    yum list installed $package &>> $LOG_FILES
    if [ $? -ne 0 ]
    then
        yum install $package -y
        VALIDATE $? "Installing $package" &>> $LOG_FILES
    else
        echo -e "$package is already installed .... $Y SKIPPING $N"
    fi 

done





