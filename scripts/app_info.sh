#!/bin/bash

include logger.sh

app_required() {
	app=${1}
    if ! hash ${app} 2>/dev/null; then
	    shift
	    log_fatal "${app} not found in your path, this is required to run. ${*}"
	fi
}

app_running() {
    pgrep ${1} > /dev/null || log_fatal "Required app ${1} is not running!"
}

