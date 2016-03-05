## Binary Search implementation


def binary_search(array, value, from=0, to=nil)
  if to.eql? nil
    to = array.length - 1
  end
  return 'element not present' if value < array.first or value > array.last
  mid = (from + to)/2
  if value < mid
    return binary_search(array, value, from, mid - 1)
  elsif value > mid
    return binary_search(array, value, mid + 1, to)
  else
    return mid
  end
end


a = (1..100).to_a

puts binary_search(a, 80)

