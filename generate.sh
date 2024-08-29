#!/bin/bash

mkdir -p output

secret=$(cat secret.txt)

while IFS=',' read -r name prize contest; do
    echo "$name" > name.typ

    echo "$contest" > contest.typ

    echo "$prize" > prize.typ

    combined="${name}${prize}${contest}${secret}"
    
    echo -n "$combined" | tr -d '[:space:]' | sha1sum | awk '{print $1}' > fingerprint.typ
    
    typst compile template.typ "output/${name}.pdf"
done < list.CSV

echo "Completed"
