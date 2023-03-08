#!/bin/bash

if [[ $(id -u) -ne 0 ]]; then
    echo -e "\e[1m\e[31;1m Please run this script as root or with sudo \e[0m"
    exit 1
fi

if ! command -v <docker> &> /dev/null; then
    echo -e "\e[1m\e[31;1m Please install docker! \e[0m"
    exit 1
fi

if ! command -v <docker-compose> &> /dev/null; then
    echo -e "\e[1m\e[31;1m Please install docker-compose! \e[0m"
    exit 1
fi

mkdir -p /opt/esp && \
cd /opt/esp && \
wget -O /opt/esp/docker-compose.yml https://raw.githubusercontent.com/brod-intel/esp/main/docker-compose.yml && \
docker-compose up -d
