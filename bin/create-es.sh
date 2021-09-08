#!/bin/bash

aws --region $AWS_REGION cloudformation create-stack \
  --stack-name "$NAME-$STAGE" \
  --template-body file://./cf-templates/es.yaml \
  --parameters ParameterKey=Stage,ParameterValue=$STAGE \
  --tags Key=$TAG_KEY,Value="$TAG_VALUE-$STAGE" \
  --role-arn $ROLE_ARN
