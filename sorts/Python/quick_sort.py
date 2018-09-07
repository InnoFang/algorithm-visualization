def quick_sort(data):
    yield from __quick_sort(data, 0, len(data) - 1)

def __quick_sort(data, start, end):
    """Quick sort: O(nlogn)"""

    if start >= end:
        return

    pivot = data[end]
    pivot_idx = start

    for i in range(start, end):
        if data[i] < pivot:
            data[i], data[pivot_idx] = data[pivot_idx], data[i]
            pivot_idx += 1
        yield data
    data[end], data[pivot_idx] = data[pivot_idx], data[end]
    yield data

    yield from __quick_sort(data, start, pivot_idx - 1)
    yield from __quick_sort(data, pivot_idx + 1, end)