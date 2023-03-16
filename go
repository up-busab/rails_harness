#!/bin/bash

if (( $# == 1 ))
then
    ./bin/enter $1
else
    echo "./go web OR ./go webrun OR ./go db OR ./go ion OR ./go iongen"
fi

