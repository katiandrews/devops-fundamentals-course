#!bin/bash

count=$(find "$1" -type f | wc -l)

echo "There are $count files"
