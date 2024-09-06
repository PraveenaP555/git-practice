#!/bin/bash

#READ_FILE=$(cat /home/ec2-user/file.txt)



# Input file
input_file="/home/ec2-user/file.txt"

input_file="data.txt"

# Output file
output_file="transposed_data.txt"

# Transpose the file
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
}' "$input_file" > "$output_file"
