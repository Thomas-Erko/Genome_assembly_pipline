import sys 

num_pre = sys.argv

num = int(num_pre[1])

def cuter(num):
    dogers = """""
    Running 
                    .--~~,__
        :-....,-------`~~'._.'
        `-,,,  ,_      ;'~U'
        _,-' ,'`-__; '--.
        (_/'~~      ''''(;
    """

    peekers = """"
    Almost there
            |\_/|        D\___/
            (0_0)         (0_o)
           ==(Y)==         (V)
----------(u)---(u)----oOo--U--oOo---
__|_______|_______|_______|_______|___
    """

    readyer = """""
    Done
     |\_/|                  
     | @ @   Woof! 
     |   <>              _  
     |  _/\------____ ((| |))
     |               `--' |   
 ____|_       ___|   |___.' 
/_/_____/____/_______|

    """

    li = [dogers, peekers, readyer]

    return li[num]

print(cuter(int(num)))
