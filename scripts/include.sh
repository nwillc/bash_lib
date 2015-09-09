#!/bin/bash

# Bootstrap the loaded
include_bootstrap() {
    [ -z "${INCLUDE_DEBUG}" ] || echo "Bootstrapping importer."
    add_include_dir "$(cd "$(dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd -P)"
    [ -z "${INCLUDE_DEBUG}" ] || show_include_dirs
}

include() {
     [ -z "${INCLUDE_DEBUG}" ] || echo -n "Including ${1} ... "
    found=false
    for script in ${INCLUDE_LOADED_SCRIPTS[@]}
    do
        if [ ${1} == ${script} ]; then
            found=true
             [ -z "${INCLUDE_DEBUG}" ] || echo "previously included."
        fi
    done

    if [ ${found} != true ]; then
        INCLUDE_LOADED_SCRIPTS[${#INCLUDE_LOADED_SCRIPTS[@]}]="${1}"
        for dir in ${INCLUDE_SCRIPT_DIRS[*]}
        do
            if [ -f "${dir}/${1}" ]; then
                 [ -z "${INCLUDE_DEBUG}" ] ||echo "sourcing ${dir}/${1}"
                source "${dir}/${1}"
                found=true
                break
            fi
        done

        if [ ${found} != true ]; then
            echo "Failed to find included script: ${1}"
            exit 1
        fi
    fi


}

add_include_dir() {
     [ -z "${INCLUDE_DEBUG}" ] || echo "Adding include dir: ${1}"
    INCLUDE_SCRIPT_DIRS[${#INCLUDE_SCRIPT_DIRS[@]}]="${1}";
}

show_include_dirs() {
    echo "Include directories: "
    for dir in ${INCLUDE_SCRIPT_DIRS[@]}
    do
        echo "   ${dir}"
    done
}

if [ -z "${INCLUDE_LOADED}" ]; then
    declare -a INCLUDE_SCRIPT_DIRS
    declare -a INCLUDE_LOADED_SCRIPTS
    include_bootstrap
    INCLUDE_LOADED=true
fi
