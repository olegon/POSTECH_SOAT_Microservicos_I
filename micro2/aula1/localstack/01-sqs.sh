#!/bin/bash

awslocal sqs create-queue \
    --queue-name produto-atualizacao-dlq

awslocal sqs create-queue \
    --queue-name produto-atualizacao \
    --attributes '{ "RedrivePolicy": "{\"deadLetterTargetArn\":\"arn:aws:sqs:us-east-1:000000000000:produto-atualizacao-dlq\",\"maxReceiveCount\":\"3\"}" }'
