#!/usr/bin/env bash
#
# build docker image
#

build()
{
    echo -e "building image: log-pilot:latest\n"

    docker build -t log-pilot:latest -f Dockerfile.$1 . \
        --build-arg HTTP_PROXY=http://127.0.0.1:1087 \
	    --build-arg HTTPS_PROXY=http://127.0.0.1:1087
}

case $1 in
fluentd)
    build fluentd
    ;;
*)
    build filebeat
    ;;
esac
