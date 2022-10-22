#!/bin/bash

# find image with react/cli:latest
IMAGEID=$(docker images | grep react/cli | grep latest | awk '{print $3}')
if [[ -z $IMAGEID ]]
then
    echo "Cannot find react/cli:latest"
else
    echo "Found react/cli:latest with IMAGEID=$IMAGEID and remove it for the build."
    docker rmi $IMAGEID
fi

docker build -t react/cli .

docker image tag react/cli:latest 10.0.0.164:5000/react-cli:latest-1
docker push 10.0.0.164:5000/react-cli:latest-1

IMAGEID=$(docker images | grep react-cli | grep latest | awk '{print $3}')
if [[ -z $IMAGEID ]]
then
    echo "Cannot find react/cli:latest"
else
    echo "Found react-cli:latest with IMAGEID=$IMAGEID so Build was successful."
fi
