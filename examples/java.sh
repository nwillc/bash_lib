#!/bin/bash

source ../scripts/include.sh

include jenv/jenv.sh
include jce.sh

# What versions available?
echo Available Java versions:
jenv versions

# pick the last one
echo Setting highest version.
jenv shell $(jenv versions | tail -1)

# What we get?
echo -n "Java version now: "
jenv version

# Does it have JCE?
jce_required
