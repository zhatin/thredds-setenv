#!/bin/sh
# Get standard environment variables
PRGDIR=`dirname "$PRG"`

# Only set CATALINA_HOME if not already set
[ -z "$CATALINA_HOME" ] && CATALINA_HOME=`cd "$PRGDIR/.." >/dev/null; pwd`

# Copy CATALINA_BASE from CATALINA_HOME if not already set
[ -z "$CATALINA_BASE" ] && CATALINA_BASE="$CATALINA_HOME"

# TDS specific ENVARS
#
# Define where the TDS content directory will live
#   THIS IS CRITICAL and there is NO DEFAULT - the
#   TDS will not start without this.
#
CONTENT_ROOT=-Dtds.content.root.path=$CATALINA_HOME/content

# set java prefs related variables (used by the wms service, for example)
JAVA_PREFS_ROOTS="-Djava.util.prefs.systemRoot=$CATALINA_HOME/content/thredds/javaUtilPrefs -Djava.util.prefs.userRoot=$CATALINA_HOME/content/thredds/javaUtilPrefs"

#
# Some commonly used JAVA_OPTS settings:
#
NORMAL="-d64 -Xmx4096m -Xms512m -server -ea"
HEAP_DUMP="-XX:+HeapDumpOnOutOfMemoryError"
HEADLESS="-Djava.awt.headless=true"

#
# Standard setup.
#
JAVA_OPTS="$CONTENT_ROOT $NORMAL $MAX_PERM_GEN $HEAP_DUMP $HEADLESS $JAVA_PREFS_ROOTS"

export JAVA_OPTS

