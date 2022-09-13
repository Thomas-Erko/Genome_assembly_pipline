import sys 


link = sys.argv[1]

def epath(link):
    path = 'fastqc_results/' + link + '_fastqc/fastqc_data.txt'

    return path 



def open_mkli(link):
    path = epath(link)
    with open(path) as f:
        file = f.read()

    li_pre = list(file.split('\n'))
    final_fastqc = []

    for i in li_pre:
        if i[:2] == '>>' and i[:4] != '>>EN':
            final_fastqc.append(i)

    return final_fastqc



def sysover(link):
    final_fastqc = open_mkli(link)
    counter = 0 

    for i in final_fastqc:
        if i[-4] == 'f':
            counter += 1

    if counter >= 2:
        ter = '1'
    else:
        ter = '0'

    sys.exit(ter)

sysover(link)
