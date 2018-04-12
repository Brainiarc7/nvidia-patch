#!/bin/bash

command -v realpath >/dev/null 2>&1 || {
    echo >&2 "This script requires \`realpath\` command but it\`s not installed.";
    echo >&2 "Please install \`coreutils\` package.";
    exit 1;
}

input="$1"
output="$2"
replacecmd='s/\x0f\x84\x0b\xfe\xff\xff/\x90\x90\x90\x90\x90\x90/'
if [ "$#" -ne 2 ]; then
  2>&1 echo "Usage: $0 <path to original libnvidia-encode.so.xxx.yy> <destination for patched libnvidia-encode.so.xxx.yy>"
  exit 2
fi
if [ "x$(realpath "$input")" = "x$(realpath "$output")" ] ; then
    sed -i.bak -e "$replacecmd" "$input"
else
    sed -e "$replacecmd" "$input" > "$output"
fi
