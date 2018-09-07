def merge_sort(data):
    yield from merge_sort(data, 0, len(data) - 1)

def merge_sort(data, start, mid, end):
    """Merge sort: O(nlogn)"""
    if end <= start:
        return

    mid = start + ((end - start + 1) // 2) - 1
    yield from mergesort(data, start, mid)
    yield from mergesort(data, mid + 1, end)
    yield from merge(data, start, mid, end)
    yield data

def merge(data, start, mid, end):
    merged = []
    left_idx = start
    right_idx = mid + 1

    while left_idx <= mid and right_idx <= end:
        if data[left_idx] < data[right_idx]:
            merged.append(data[left_idx])
            left_idx += 1
        else:
            merged.append(data[right_idx])
            right_idx += 1

    while left_idx <= mid:
        merged.append(data[left_idx])
        left_idx += 1

    while right_idx <= end:
        merged.append(data[right_idx])
        right_idx += 1

    for i, sorted_val in enumerate(merged):
        data[start + i] = sorted_val
        yield data