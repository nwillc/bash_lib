#!/bin/bash

# colors for colorEcho
red=1
green=2
yellow=3
blue=4
magenta=5
cyan=6
white=7

lightRed=8
lightGreen=9
lightYellow=10
lightBlue=11
lightMagenta=12
lightCyan=13
lightWhite=14

colorEcho() {
    # Pass all "-" args to echo.
    args=
    while [ "${1:0:1}" == '-' ]
    do
      args="${args} ${1}"
      shift 1
    done
    color=${1}
    shift 1

    if [ "${color}" -gt "${white}" ]; then
      color=$(( ${color} - ${white} ))
      echo -n "$(tput bold)"
    fi

    echo $args "$(tput setaf ${color})${*}$(tput sgr0)"
}
