#!/bin/bash

ROLE_ARN='arn:aws:iam::123456789:role/cf-role'
TAG_KEY=role
TAG_VALUE=aws-elasticsearch
AWS_REGION=us-east-1

aws --region $AWS_REGION cloudformation create-stack \
  --stack-name ip-data-exporter-elasticsearch-$STAGE \
  --template-body file://./cf-templates/es.yaml \
  --parameters ParameterKey=Stage,ParameterValue=$STAGE \
  --tags Key=$TAG_KEY,Value="$TAG_VALUE-$STAGE" \
  --role-arn $ROLE_ARN
