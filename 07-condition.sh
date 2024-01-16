#!/bin/bash

echo "Enter the number"

read $NUMBER

if [ $NUMBER -gt 100 ]
then
    echo "$NUMBER is greater than 100"
else
    echo "$NUMBER is less than 100"
fi