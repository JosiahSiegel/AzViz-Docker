#!/bin/bash

FILE=./viz_config.sh
if [[ ! -f $FILE ]]; then
echo -e "
# CREATE CONFIG FILE: 
#
# viz_config.sh
#
# SHORTCUT:
#
# cp -n sample.viz_config.sh viz_config.sh
#
# =======================
# sample.viz_config.sh
# =======================
"

cat ./sample.viz_config.sh

exit
fi

source $FILE

docker build -t viz-image -f ./lib/Dockerfile .

CONTAINER_NAME=az-viz

if [[ $(docker ps -a --filter="name=$CONTAINER_NAME" --filter "status=exited" | grep -w "$CONTAINER_NAME") ]]; then
    echo "$CONTAINER_NAME start ..."
    docker start $CONTAINER_NAME
elif [[ $(docker ps -a --filter="name=$CONTAINER_NAME" --filter "status=running" | grep -w "$CONTAINER_NAME") ]]; then
    echo "$CONTAINER_NAME still running"
else
    echo "$CONTAINER_NAME run ..."
    docker run --name $CONTAINER_NAME -it --detach viz-image
fi
docker cp $FILE $CONTAINER_NAME:/etc/viz_config.sh
docker exec -it $CONTAINER_NAME pwsh -Command "& {/etc/viz_run.ps1}"
docker cp $CONTAINER_NAME:$OUT_FILE .$OUT_FILE
echo "Writing diagram: $OUT_FILE"
echo "$CONTAINER_NAME stopping ..."
docker stop $CONTAINER_NAME
