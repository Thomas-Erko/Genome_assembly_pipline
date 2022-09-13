import sys 
import zipfile

link = sys.argv[1]

print('\n===',link,'===')

def FindPath(link):
    # bringing the file information in
    var1 = str(link)
    var = var1[::-1]
    print(var1)

    pop = 0
    for i in range (len(var)):
        if var[i] == '/':
            best = var1[-i:-8]
            break 

    path = 'fastqc_results/' + best + '_fastqc/fastqc_data.txt' 

    return path


def FindzPath(link):
    # bringing the file information in
    var1 = str(link)
    var = var1[::-1]

    pop = 0
    for i in range (len(var)):
        if var[i] == '/':
            best = var1[-i:-8]
            break 

    zpath = 'fastqc_results/' + best + '_fastqc.zip'
    
    return zpath


def epath(link):
    path = 'fastqc_results/' + link + '_fastqc/fastqc_data.txt'

    return path 

def ezpath(link):
    zpath = 'fastqc_results/' + link + '_fastqc.zip'

    return zpath 

def unzip(link):
    zpath = ezpath(link)
    with zipfile.ZipFile(zpath, 'r') as zip_ref:
        zip_ref.extractall('fastqc_results')


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

def end(link):
    print('\nFastqc : Success\n')

    # unzip(link)

    print('Unzip : Success\n')



    final_fastqc = open_mkli(link)

    print('\t######### Fastqc ##########\n\n')

    print (*final_fastqc, sep = '\n\n', end = '\n\n')

def sysover(link):
    final_fastqc = open_mkli(link)
    counter = 0 

    for i in final_fastqc:
        if i[-4] == 'f':
            counter += 1

    if counter >= 2:
        ter = '0'
    else:
        ter = '1'

    sys.exit(ter)


end(link)



