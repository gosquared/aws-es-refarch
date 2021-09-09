# aws-es-refarch
Reference architecture for an Amazon ES cluster
# Usage

```bash
export NAME='aws-refarch-test'
export STAGE=dev
export ROLE_ARN='arn:aws:iam::123456789:role/cf-role'
export TAG_KEY=role
export TAG_VALUE=$NAME
export AWS_REGION=us-east-1

aws-vault exec admin

aws --region $AWS_REGION cloudformation create-stack \
  --stack-name "$NAME-$STAGE" \
  --template-body file://./cf-templates/es.yaml \
  --parameters ParameterKey=Stage,ParameterValue=$STAGE \
  --tags Key=$TAG_KEY,Value="$TAG_VALUE-$STAGE" \
  --role-arn $ROLE_ARN

# additional parameters:
  ParameterKey=EsVersion,ParameterValue=7.9 \
  ParameterKey=NumNodes,ParameterValue=1 \
  ParameterKey=InstanceType,ParameterValue=t3.small.elasticsearch \
```

Instance types: https://aws.amazon.com/opensearch-service/pricing/
