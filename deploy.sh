#!/bin/bash

if [[ $(id -u) -ne 0 ]]; then
    echo -e "\e[1m\e[31;1m Please run this script as root or with sudo \e[0m"
    exit 1
fi

if ! command -v docker >/dev/null 2>&1; then
    echo -e "\e[1m\e[31;1m Please install docker! \e[0m"
    exit 1
fi

if ! command -v docker-compose >/dev/null 2>&1; then
    echo -e "\e[1m\e[31;1m Installing docker-compose.! \e[0m"
    wget -O /usr/local/bin/docker-compose "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" && \
    chmod a+x /usr/local/bin/docker-compose
fi

mkdir -p /opt/esp && \
cd /opt/esp && \
wget -qO /opt/esp/docker-compose.yml https://raw.githubusercontent.com/brod-intel/esp/main/docker-compose.yml && \
docker-compose up -d
