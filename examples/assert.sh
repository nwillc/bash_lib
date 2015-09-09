#!/bin/bash

INCLUDE_DEBUG=true
source ../scripts/include.sh

include logger.sh
include assert.sh

log_info Testing pass
assert "$? -eq 0" Last command passed.

log_info Testing fail
false
assert " $? -eq 0 " Last command passed.