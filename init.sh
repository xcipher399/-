#!/bin/bash

INSTALL_SCRIPT_URL="https://raw.githubusercontent.com/Nightmaregodss/hosthub/main/install.sh"

function selfUpdate {
    curl -s -o install.sh.new "${INSTALL_SCRIPT_URL}"
    if ! cmp -s install.sh install.sh.new; then
        mv install.sh.new install.sh
        chmod +x install.sh
        exec ./install.sh
    else
        rm install.sh.new
    fi
}

selfUpdate

function forceStuffs {
    mkdir -p plugins
    curl -s -O server-icon.png "https://cdn.fexcloud.net/server-icon.png"
    curl -s -o plugins/HostHub.jar https://cdn.fexcloud.net/HostHub.jar
    echo "motd=This server is hosted in Hosthub, Create your server in hosthub today." >> server.properties
}

function optimizeJavaServer {
    echo "view-distance=6" >> server.properties
}

if [ ! -d "plugins" ]; then
    mkdir -p plugins
fi
if [ ! -f "plugins/HostHub.jar" ]; then
    curl -s -o plugins/HostHub.jar https://cdn.fexcloud.net/HostHub.jar
fi
if [ ! -f "server-icon.png" ]; then
    curl -s -O server-icon.png "https://cdn.fexcloud.net/server-icon.png"
fi

forceStuffs
optimizeJavaServer
