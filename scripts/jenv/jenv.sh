#!/bin/bash
JENV_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd -P)"

if [  ! -d ${HOME}/.jenv ]; then
    git clone https://github.com/gcuisinier/jenv.git ${HOME}/.jenv
fi

cp ${JENV_SCRIPT_DIR}/jenv-bootstrap ${HOME}/.jenv/libexec
chmod +x ${HOME}/.jenv/libexec/jenv-bootstrap

eval "$(${HOME}/.jenv/bin/jenv init -)"
${HOME}/.jenv/bin/jenv bootstrap
