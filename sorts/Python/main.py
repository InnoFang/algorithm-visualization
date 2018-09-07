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

titles = {
    'b' : r'Bubble Sort ($O(n^2)$)',
    'i' : r'Insertion Sort ($O(n^2)$)',
    'm' : r'Merge Sort ($O(n \cdot log_2(n))$)',
    'q' : r'Quick Sort ($O(n \cdot log_2(n))$)',
    's' : r'Selection Sort ($O(n^2)$)' 
}

invalid = '?'

menu = '''\033[1;32;40m
Sorting Method Menu:

    (b)ubble 
    (i)nsertion 
    (m)erge 
    (q)uick 
    (s)election 
    Press `Ctrl + C` and confirm `Enter` that can be exit.\033[0m
'''

def main(): 
    order = input('--> ')

    sorting = sorting_method[order] if order in sorting_method else invalid
    if sorting == invalid:
        print(' ~  INVALID!')
        return

    total = int(input("Enter the total number what you need: \n--> "))
    data = [x + 1 for x in range(total)]
    random.seed(time.time())
    random.shuffle(data)

    generator = sorting(data)

    fig, ax = plt.subplots()
    ax.set_title(titles[order])
    bar_rects = ax.bar(range(len(data)), data, align='edge')
    # Set axis limits. Set y axis upper limit high enough that the tops of
    # the bars won't overlap with the text label.   
    ax.set_xlim(0, total)
    ax.set_ylim(0, int(1.20 * total))
    
    text = ax.text(0.02, 0.95, "", transform=ax.transAxes)

    interation = [0]
    
    def update_fig(data, rects, interation):
        for rect, val in zip(rects, data):
            rect.set_height(val)
        interation[0] += 1
        text.set_text('Operation: #{}'.format(interation[0]))
    
    try:
        anim = animation.FuncAnimation(fig,  func=update_fig, fargs=(bar_rects, interation), 
                                    frames=generator, interval=1, repeat=False)
        plt.show()                               
    except BaseException:
        print(' ~  TERMINATION!')

def quit(signum, frame):
    print('Thank you for using.')
    sys.exit()

if __name__ == '__main__': 
    # ENter `Ctrl + C` to terminal the process
    signal.signal(signal.SIGINT, quit) 
    signal.signal(signal.SIGTERM, quit)
    print(menu)
    while True:
        main()