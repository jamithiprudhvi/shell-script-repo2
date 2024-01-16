#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "you are not a root user"
    exit 1
else
    echo "you are a root user"
fi

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "ERROR:: Instillation MYSQL is failed"
else
    echo "Instillation MYSQL is success"
fi