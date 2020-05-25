#!/bin/bash

set -euo pipefail

# HACK: Prevent stack aborting with "You are not the owner of ..." error
mkdir -p /github/home/.stack/

stack test --allow-different-user
test-e2e/run.sh
