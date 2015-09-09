#!/bin/bash

include app_info.sh

ip_address() {
    app_required ifconfig
    ifconfig | grep inet.*broadcast | awk '{print $2}' | head -1
}

