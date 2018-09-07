import random
import time
import sys
import signal
import matplotlib.pyplot as plt
import matplotlib.animation as animation

from bubble_sort import bubble_sort
from insertion_sort import insertion_sort
from merge_sort import merge_sort
from quick_sort import quick_sort
from selection_sort import selection_sort

sorting_method = {
    'b' : bubble_sort, 
    'i' : insertion_sort,
    'm' : merge_sort,
    'q' : quick_sort,
    's' : selection_sort
    }

INVALID_ORDER = '?'

def main(): 
    total = int(input("Enter the total number what you need? "))
    menu = '''Enter sorting method:

    (b)ubble 
    (i)nsertion 
    (m)erge 
    (q)uick 
    (s)election 
    '''
    order = input(menu)

    data = [x + 1 for x in range(total)]
    random.seed(time.time())
    random.shuffle(data)

    method = sorting_method[order](data) if order in sorting_method else INVALID_ORDER
    if method == INVALID_ORDER:
        print('Invalid order!')

def quit(signum, frame):
    print('Thank you for using.')
    sys.exit()

if __name__ == '__main__':
    # while 1:
        # try:
        #     main()
        # except KeyboardInterrupt:
        #     pass
    signal.signal(signal.SIGINT, quit) 
    signal.signal(signal.SIGTERM, quit)
    while True:
        main()