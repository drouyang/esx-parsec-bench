#!/bin/bash
# usage ./data-proc.sh <filename>

# ubuntu is the host name
grep real $1 | grep ubuntu | awk '{print $4}' | python utils/min2sec.py
