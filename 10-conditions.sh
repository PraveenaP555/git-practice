#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 20 ] #gt,lt,eq,-ne
then
    echo "number is greater than 20"
else
    echo "number is less than 20"
fi
