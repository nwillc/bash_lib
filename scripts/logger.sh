#!/bin/bash

include color_echo.sh

log_level_color() {
  level=$1
  color=$2
  shift 2

  colorEcho ${color} "[${level}] ${*}"
}

log_info() {
  log_level_color "INFO" ${green} "$*"
}

log_warn() {
  log_level_color "WARNING" ${yellow} "$*"
}

log_error() {
  log_level_color "ERROR" ${red} "$*"
}

log_fatal() {
  log_error "$*"
  exit 1
}
