#!/bin/bash

set -e

cd /root/solr4
echo 'Starting server'

# We use exec to allow process monitors to correctly kill the
# actual Java process rather than this launcher script:
export CMD="java -Djetty.port=8983 -Djava.awt.headless=true -Dapple.awt.UIElement=true -Dsolr.install.dir=`pwd` -jar start.jar"

if [ -z "${BACKGROUND_SOLR}" ]; then
    exec $CMD
else
    exec $CMD >/dev/null &
fi
