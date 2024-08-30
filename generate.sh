#!/usr/bin/env bash

processBar()
{
    local current=$1
    local total=$2
    local name=$3
    local contest=$4
    local prize=$5
    local percentage=$((current*100/total))
    printf "\r[INF] Processing: $name, $contest, $prize - $current/$total ($percentage%%)"
}

# Read Parameters
while getopts ":g:s:h" opts; do
    case ${opts} in
        g)  gpg_key=$OPTARG
            # Check if GPG key exists
            if ! gpg --list-secret-keys $gpg_key > /dev/null 2>&1; then
                echo "[ERR] GPG Key not found"
                exit 1
            else
                echo "[INF] Using GPG Key: $gpg_key"
            fi
            ;;
        s)  secret=$OPTARG
            echo "[INF] Using Secret: $secret"
            ;;
        h)  echo "[INF] Usage: $0 [-g <gpg_key>] [-s <secret>]"
            echo "[INF]     Default: use secret from secret.txt."
            echo "[INF]     You can also provide a GPG key or a custom secret instead to generate the certificates."
            exit 1
            ;;
        \?) echo "[ERR] Invalid option: $OPTARG" 1>&2
            exit 1
            ;;
    esac
done

if [ -n "$gpg_key" ] && [ -n "$secret" ]; then
    echo "[ERR] Both GPG key and secret provided. Please provide only one."
    exit 1
fi

if [ -z "$gpg_key" ] && [ -z "$secret" ]; then
    echo "[ERR] No GPG key or secret provided. Using default key in secret.txt"
    if [ -f secret.txt ]; then
        secret=$(cat secret.txt)
        if [ -z "$secret" ]; then
            echo "[ERR] secret.txt is empty"
            exit 1
        fi
        echo "[INF] Using Secret: $secret"
    else
        echo "[ERR] secret.txt not found"
        exit 1
    fi
fi

# Run the script

mkdir -p output

whole=$(wc -l < list.CSV)
process=0

while IFS=',' read -r name prize contest; do
    echo "$name" > name.typ

    echo "$contest" > contest.typ

    echo "$prize" > prize.typ

    if [ -z "$gpg_key" ]; then
        combined="${name}${prize}${contest}${secret}"
        echo -n "$combined" | tr -d '[:space:]' | sha1sum | awk '{print $1}' > fingerprint.typ
    else
        combined="${name}${prize}${contest}"
        echo -n "$combined" | tr -d '[:space:]' | gpg --sign --local-user $gpg_key --armor | sha1sum | awk '{print $1}' > fingerprint.typ
    fi

    typst compile template.typ "output/${name}.pdf"

    process=$((process+1))
    processBar $process $whole $name $contest $prize
done < list.CSV

echo "[INF] Completed"
