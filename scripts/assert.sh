#!/bin/bash

include logger.sh

assert() {
   if [ $(test $1 ; echo $? ) -ne 0 ]; then
        shift
        log_fatal Assertion failed: $*
   fi
}
