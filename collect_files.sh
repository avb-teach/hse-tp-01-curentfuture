#!/bin/bash

input_directory="$1"
output_directory="$2"
counter=1
find "$input_directory" -type f | while read file; do
        
        file_name_initial=$(basename "$file")

        if [ -f "$output_directory/$file_name_initial" ]; then
                name_del_ext="${file_name_initial%.*}"
                ext="${file_name_initial##*.}"
                
                if [ "$name_del_ext" = "$file_name_initial" ]; then
                        ext=""
                        new_name="${$name_del_ext}${counter}"
                else
                        new_name="${name_del_ext}${counter}.${ext}"
                fi
                ((counter++))
        else
                new_name="$file_name_initial"
        fi
        cp "$file" "$output_directory/$new_name"
done