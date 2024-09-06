#!/bin/bash

#READ_FILE=$(cat /home/ec2-user/file.txt)



# Input file
input_file="/home/ec2-user/file.txt"
# Temporary files
temp_file1=$(mktemp)
temp_file2=$(mktemp)

# Transpose the rows to columns
awk '
{
    for (i = 1; i <= NF; i++) {
        matrix[NR, i] = $i
    }
    n = NF
} 
END {
    for (i = 1; i <= n; i++) {
        for (j = 1; j <= NR; j++) {
            if (j > 1) printf " "
            printf "%s", matrix[j, i]
        }
        printf "\n"
    }
}' "$input_file" > "$temp_file1"

# Move the result to the output file
mv "$temp_file1" "transposed_file.txt"

# Clean up temporary files
rm -f "$temp_file2"
