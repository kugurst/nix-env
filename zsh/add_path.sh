#!/bin/zsh

echo "PATH before:
$PATH"

PAT="$PATH"
PATH=""

function add_to_path {
    zparseopts -D -E -- r::=R
    echo "$R"

    ADDR=("${(@s/:/)1}")
    for i in "${ADDR[@]}"; do
        if [[ ! "$PATH" == *"$i"* ]]; then
            if [[ ! -z "$R" ]]; then
                PATH="$PATH:$i"
            else
                PATH="$i:$PATH"
            fi
        fi
    done

    if [[ "$PATH" == ":"* ]]; then
        PATH="${PATH#":"}"
    elif [[ "$PATH" == *":" ]]; then
        PATH="${PATH%":"}"
    fi

    export PATH="$PATH"
}

add_to_path -r "$PAT"

echo "
PATH after:
$PATH"
