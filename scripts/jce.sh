#!/bin/bash
JCE_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd -P)"

include logger.sh

jce_required() {
    java -jar ${JCE_SCRIPT_DIR}/../lib/jcetest-1.0.jar > /dev/null
    if [ $? -ne 0 ]; then
        log_fatal "JCE required, not present in JDK."
    fi
}
