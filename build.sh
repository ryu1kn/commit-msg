#!/bin/bash

set -euo pipefail

# DEBUG: investigating stack error
id
ls -ld "$(pwd)"
ls -ld "/github/home"
mkdir -p /github/home/.stack/

stack test --allow-different-user
test-e2e/run.sh
