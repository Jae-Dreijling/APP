# Count pairs where first number is less than second number
numbers = [1, 5, 3, 8, 2, 9, 4]

# Step 1: Create all possible pairs
def make_all_pairs(nums):
    """Create all pairs from the list"""
    pairs = []
    for i in range(len(nums)):
        for j in range(i + 1, len(nums)):
            pairs.append([nums[i], nums[j]])
    return pairs

# Step 2: Filter pairs where first < second
def filter_valid_pairs(all_pairs):
    """Keep only pairs where first number is less than second"""
    valid_pairs = []
    for pair in all_pairs:
        if pair[0] < pair[1]:
            valid_pairs.append(pair)
    return valid_pairs

# Step 3: Count the pairs
def count_pairs(pairs):
    """Count how many pairs we have"""
    count = 0
    for pair in pairs:
        count = count + 1
    return count

# Do the work
all_pairs = make_all_pairs(numbers)
valid_pairs = filter_valid_pairs(all_pairs)
total_count = count_pairs(valid_pairs)

# Show results
print(f"Pairs where first < second: {valid_pairs}")
print(f"Total count: {total_count}")

