#!/usr/bin/env bash
#===============================================================================
#NAME
#  files_in_file_content.bash


# DESCRIPTION
#  Return path of everything in folder/ wich is inside text_file.txt
#  Run script:
#     source files_in_file_content.bash text_file.txt folder/
#
#===============================================================================
search="$1"
folder="$2"

if [[ $search == "" || $folder == "" ]]; then
  echo "Invalid arguments" && return
fi

files_in_folder="$( find $folder )"

for file in ${files_in_folder[@]}; do
  if grep -q "$file" "$search"; then
    echo "$file"
  fi
done
