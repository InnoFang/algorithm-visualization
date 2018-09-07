def bubble_sort(data):
    """Bubble sort: O(n^2)"""

    if len(data) == 1:
        return

    swapped = True
    for i in range(len(data) - 1):
        if not swapped:
            break
        swapped = False
        for j in range(len(data) - 1 - i):
            if data[j] > data[j + 1]:
                swap(data, j, j + 1)
                data[j], data[j + 1] = data[j + 1], data[j]
                swapped = True
            yield data