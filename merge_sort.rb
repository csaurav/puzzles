# Mergesort(A): # 1. return A if n == 1
# 2. left = left half of A
# 3. right = right half of A
# 4. sorted_left = Mergesort(left)
# 5. sorted_right = Mergesort(right)
# 6. return merge(sorted_left, sorted_right))
#
#
#



def merge(left_sorted, right_sorted)
  if left_sorted.empty?
    right_sorted
  elsif right_sorted.empty?
    left_sorted
  elsif left_sorted.first < right_sorted.first
    [left_sorted.first] + merge(left_sorted[1..left_sorted.length], right_sorted)
  else
    [right_sorted.first] + merge(left_sorted, right_sorted[1..right_sorted.length])
  end
end


def mergesort_iter(array_sliced)
  return array_sliced if array_sliced.length <= 1
  mid = array_sliced.length/2 - 1
  left_sorted = mergesort_iter(array_sliced[0..mid])
  right_sorted = mergesort_iter(array_sliced[mid+1..-1])
  return merge(left_sorted, right_sorted)
end

array = [10, 6,4, 5, 11, 12, 9] 

puts "original array: #{array}"


print mergesort_iter(array)
