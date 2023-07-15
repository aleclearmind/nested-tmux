#!/usr/bin/env bash

export TPM_PLUGIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmux source-file "${TPM_PLUGIN_DIR}/active-row.conf"
