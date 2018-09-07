def selection_sort(data):
    """Insetion sort: O(n^2)"""
    if len(data) == 1:
        return

    for i in range(len(data)):
        # Find minimum unsorted value.
        min_val = data[i]
        min_idx = i
        for j in range(i, len(data)):
            if data[j] < min_val:
                min_val = data[j]
                min_idx = j
            yield data
        data[i], data[min_idx] = data[min_idx], data[i] 
        yield data