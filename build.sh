#!/bin/bash

set -euo pipefail

# DEBUG: investigating stack error
id
ls -ld "$(pwd)"
ls -ld "/github/home"

stack test
test-e2e/run.sh
