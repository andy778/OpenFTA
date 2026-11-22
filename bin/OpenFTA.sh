#!/bin/sh

# OpenFTA loads libfta.so from the working directory, so run from bin/.
cd "$(dirname "$0")" || exit 1

export "CLASSPATH=FTAGUI.jar:images.jar"

# Use $JAVA_HOME when it is set, otherwise the java on PATH.
if [ -n "$JAVA_HOME" ]; then
  JAVA="$JAVA_HOME/bin/java"
else
  JAVA=java
fi

exec "$JAVA" -Xmx256m --enable-native-access=ALL-UNNAMED FTAGUI.OpenFTA "$@"
