#!/bim/bash 


file_prep () {
    # $1 = accension #
    # fetching the seq 

    SRA-toolkit/sratoolkit.3.0.0-mac64/bin/prefetch $1

    # spliting the file 

    fasterq-dump -O SRA-toolkit/tmp/sra --split-files $1

    # compressing the file 
    gzip SRA-toolkit/tmp/sra/$1_1.fastq && gzip SRA-toolkit/tmp/sra/$1_2.fastq 

    # deleting the non compressed files
    rm SRA-toolkit/tmp/sra/$1_1.fastq && rm SRA-toolkit/tmp/sra/$1_2.fastq 

}

# does fastqc and uses dir_finder.py to get the information 

fastqc_comp () {

    # $1 = accension #

    echo '######### FastQC #########'
    python3 cuter.py 0
    sleep .5

    fastqc -o fastqc_results SRA-toolkit/tmp/sra/$1_1.fastq.gz SRA-toolkit/tmp/sra/$1_2.fastq.gz

    python3 cuter.py 1
    sleep 2

    python3 dir_finder.py $1_1

    python3 dir_finder.py $1_2

    python3 cuter.py 2


}

# makes sure the there are not more than 2 fails before continuing 

bypass () {

    arg1=`python3 bypass.py $1_1`
    echo $arg1

    arg2=`python3 bypass.py $1_2`
    echo $arg2

    if [ $arg1='1' ] || [ $arg2='1']; then
        echo 'You have 2 or more fails in your fastqc runs.'
        read -p 'Would you like to continue to spades [y,n]: ' ans1

        if [ $ans1 = 'y' ]; then 
            echo "Continuing"
        elif [ $ans1 = 'n' ]; then 
            echo 'Bye'
            exit 1
        fi
    fi




}

# cleans the data with trimmomatric 
trimer () {
    echo '######### Trimmer #########'
    #Trim starts running here

    #finding the parameters
    #----

    #user input overide 

    read -p 'Would you like to input user paramaters [y,n]: ' ans2

    if [ $ans2 = 'y' ]; then 
        read -p 'Enter your LEADING value as an intiger: ' param1
        read -p 'Enter your LAGGING value as an intiger: ' param2
        read -p 'Enter your SLIDINGWINDOW k-mer value as an intiger: ' param3_1
        read -p 'Enter your SLIDINGWINDOW cutoff value as an intiger: ' param3_2
        read -p 'Enter your MINLEN value as an intiger: ' param4

        trimmomatic PE SRA-toolkit/tmp/sra/$1_1.fastq.gz SRA-toolkit/tmp/sra/$1_2.fastq.gz SRA-toolkit/tmp/sra/$1_1_paired.fastq.gz SRA-toolkit/tmp/sra/$1_1_unpaired.fastq.gz SRA-toolkit/tmp/sra/$1_2_paired.fastq.gz SRA-toolkit/tmp/sra/$1_2_unpaired.fastq.gz LEADING:$param1 TRAILING:$param2 SLIDINGWINDOW:$param3_1:$param3_2 MINLEN:$param4  
    
    elif [ $ans2 = 'n' ]; then
        echo 'Bye'
        exit 1

    else 
        echo 'you suck'
        exit 1
    fi

}

# start the spades alignment process with spades

spade_jade () {

    # initial spades error correction 

    echo '######### Spades Error Correction #########'
    # spades.py -1 SRA-toolkit/tmp/sra/$1_1_paired.fastq.gz -2 SRA-toolkit/tmp/sra/$1_2_paired.fastq.gz -o spades_results --only-error-correction 


    # spades alignment 

    echo '######### Spades Aligment #########'
    



}








#Functions stop here 
#=====================================================================#
#Code starts running here


spade_jade $1




