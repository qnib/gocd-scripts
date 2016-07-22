#!/bin/bash

if [ "X${GOCD_SERVER_URL}" == "X" ];then
    export GOCD_SERVER_URL=http://gocd-server:8153/go
fi

if [ ! -z ${GOCD_CREDENTIALS} ];then
    GOCD_AUTH="-u '${GOCD_CREDENTIALS}'"
fi

if [ -z ${GO_STAGE_NAME} ];then
    echo "GO_STAGE_NAME is not set, exiting..."
    exit 0
fi
if [ -z ${GO_PIPELINE_NAME} ];then
    echo "GO_PIPELINE_NAME is not set, exiting..."
    exit 0
fi

echo ">>> curl -X POST ${GOCD_SERVER_URL}/api/stages/${GO_PIPELINE_NAME}/${GO_STAGE_NAME}/cancel"
curl -s "${GOCD_SERVER_URL}/api/stages/${GO_PIPELINE_NAME}/${GO_STAGE_NAME}/cancel" \
      ${GOCD_AUTH} -X POST
