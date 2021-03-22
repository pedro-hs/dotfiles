#!/usr/bin/env bash
separator=$(perl -E "say '#' x 20")

print_message() {
    echo -e "\n\n\n\n"
    echo "$separator  $1  $separator"
    echo -e "\n"
}
