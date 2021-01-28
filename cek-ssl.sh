#!/bin/bash
cat url.txt | while read line; do echo $line >> a.txt&&  curl --insecure -vvI https://www.$line 2>&1 | awk 'BEGIN { cert=0 } /^\* SSL connection/ { cert=1 } /^\*/ { if (cert) print }' | grep expire >> a.txt && echo " $line done"; done
cat a.txt
echo "" > a.txt
