#!/bim/bash 

# $1 = accension #

python3 cuter.py 0
sleep .5

fastqc -o fastqc_results SRA-toolkit/tmp/sra/$1_1.fastq.gz SRA-toolkit/tmp/sra/$1_2.fastq.gz

python3 cuter.py 1
sleep 2

python3 dir_finder.py $1_1

python3 dir_finder.py $1_2

python3 cuter.py 2

