def quick_sort(data):
    yield from quick_sort(data, 0, len(data) - 1)

def quick_sort(data, start, end):
    """Quick sort: O(nlogn)"""

    if start >= end:
        return

    pivot = data[end]
    pivot_idx = start

    for i in range(start, end):
        if data[i] < pivot:
            datat[i], data[pivot_idx] = data[pivot_idx], data[i]
            pivot_idx += 1
        yield data
    datat[end], data[pivot_idx] = data[pivot_idx], data[end]
    yield data

    yield from quicksort(data, start, pivot_idx - 1)
    yield from quicksort(data, pivot_idx + 1, end)