#!/usr/bin/env bash
set -Ceu

SCRIPT_DIR=$(cd $(dirname $0); pwd)

${SCRIPT_DIR}/stop.sh
${SCRIPT_DIR}/start.sh
