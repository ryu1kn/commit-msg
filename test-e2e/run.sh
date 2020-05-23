#!/bin/bash

set -euo pipefail

this_dir="$(dirname "$BASH_SOURCE")"
project_root="$this_dir/.."
test_tmp_dir="$this_dir/tmp"

tmp_file="$test_tmp_dir/commit-msg.txt"

rm -rf "$test_tmp_dir" && mkdir -p "$test_tmp_dir"
cp "$project_root/fixtures/sample.txt" "$tmp_file"

(
    cd "$project_root"
    stack build
    stack exec -- commit-msg-exe "$tmp_file"
    diff "$tmp_file" "$this_dir/expected.txt"
)
