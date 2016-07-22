#!/bin/bash

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

echo ">>> curl -X POST http://gocd-server.node.consul:8153/go/api/stages/${GO_PIPELINE_NAME}/${GO_STAGE_NAME}/cancel"
curl "http://gocd-server.node.consul:8153/go/api/stages/${GO_PIPELINE_NAME}/${GO_STAGE_NAME}/cancel" \
      ${GOCD_AUTH} -X POST
