#!/bin/sh
for STYLE in {0..7}; do
    for FG in {30..37}; do
        for BG in {40..47}; do
            CTRL="\033[${STYLE};${FG};${BG}m"
            echo -en "${CTRL}"
            echo -n "${STYLE};${FG};${BG}"
            echo -en "\033[0m"
        done
        echo
    done
    echo
done

echo -e "\033[0m";
