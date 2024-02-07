#!/bin/bash

set -ev

docker-compose up -d db-estoque

docker-compose up -d estoque-{1,2,3}

docker-compose up -d db-kong

while ! docker-compose up kong-migrations; do
    echo "Waiting..."
    sleep 1;
done;

while ! docker-compose up kong-migrations-up; do
    echo "Waiting..."
    sleep 1;
done;

docker-compose up -d kong
