#!/bin/bash

function recurse {
    for f in "$1"/*; do
        if [[ "$f" == *"bin" ]]; then
            ret="$ret:$f"
            echo "ln -s $(readlink -f "$f")/* $2"
            ln -s "$(readlink -f "$f")"/* $2
        elif [[ -d "$f" ]]; then
            recurse "$f" "$2"
        fi
    done
}

recurse $1 $2
echo $ret
