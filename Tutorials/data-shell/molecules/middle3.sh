#!/usr/bin/env bash

# Select lines from the middle of a file.
# Usage: stdin | middle.sh end_line num_lines
head -n "$1" | tail -n "$2"
