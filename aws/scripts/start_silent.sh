#!/bin/bash

while getopts a: flag
do
    case "${flag}" in
        a) JAR_NAME=${OPTARG};;
    esac
done

nohup java -jar "$JAR_NAME" > foo.out 2> foo.err < /dev/null & echo $! > ./pid.file