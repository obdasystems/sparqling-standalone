#!/usr/bin/env bash
############################################################
# Sparqling Startup Script
############################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set HOME location
HOME="${SCRIPT_DIR}"
JAR="sparqling-ws-1.0.0.jar"

# Check that java can be found in PATH
if [[ -n "$JAVA_HOME" ]]; then
    JAVA="$JAVA_HOME/bin/java"
else
    JAVA="$(which java)"
fi

if [[ -z "$JAVA" ]] || [[ ! -x "$JAVA" ]]; then
    echo "Unable to find java executable, exiting..."
    exit 1
fi

echo "Using java from: $JAVA"

# Java options
JAVA_OPTS="${JAVA_OPTS:--Dlogback.configurationFile="$HOME/logback.xml"}"
# Java extra (platform-specific) options 
JAVA_EXT_OPTS=

# Use dock icon on macOS
if [[ "$OSTYPE" =~ ^darwin* ]]; then
    JAVA_EXT_OPTS="-Xdock:icon=$HOME/resources/icons/icon_512@1x.png"
fi

# Start Jetty WebServer
"$JAVA" \
    $JAVA_OPTS ${JAVA_EXT_OPTS:+"$JAVA_EXT_OPTS"} \
    -jar "$HOME/$JAR" \
    "$HOME/ui"
