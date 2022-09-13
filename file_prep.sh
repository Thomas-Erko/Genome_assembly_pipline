#!/bim/bash 

# $1 = accension #
# fetching the seq 

SRA-toolkit/sratoolkit.3.0.0-mac64/bin/prefetch $1

# spliting the file 

fasterq-dump -O SRA-toolkit/tmp/sra --split-files $1

# compressing the file 
gzip SRA-toolkit/tmp/sra/$1_1.fastq && gzip SRA-toolkit/tmp/sra/$1_2.fastq 

# deleting the non compressed files
rm SRA-toolkit/tmp/sra/$1_1.fastq && rm SRA-toolkit/tmp/sra/$1_2.fastq 