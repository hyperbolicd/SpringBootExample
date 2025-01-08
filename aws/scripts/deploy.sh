#!/bin/bash

while getopts s:a: flag
do
    case "${flag}" in
        s) AWS_S3_BUCKET_NAME=${OPTARG};;
        a) JAR_NAME=${OPTARG};;
    esac
done

echo "s3://$AWS_S3_BUCKET_NAME/$JAR_NAME"

su ec2-user
aws s3 cp "s3://$AWS_S3_BUCKET_NAME/$JAR_NAME" "$JAR_NAME"