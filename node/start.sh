#!/bin/bash

: "${EXECUTER:=node}" # the executer to be used
: "${APP:=start}" # the app's entry point or executer command

# Start node.js application
$EXECUTER $APP