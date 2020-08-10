#!/bin/bash
set -e
## pass the image-name from console as param
NAME=$1
REGISTRY="<gitlab-registry>"
FULLNAME=${REGISTRY}/${NAME}

docker build -t $FULLNAME:${CI_JOB_ID} .
docker tag $FULLNAME:${CI_JOB_ID} $FULLNAME:${CI_PIPELINE_ID}
--docker tag $FULLNAME:${CI_JOB_ID} $FULLNAME:latest (if the latest tag is required.)
docker push ${FULLNAME}
