## Given array of n integers and given a number X, 
#Find all the unique pairs of elements (a,b), whose summation is equal to X.

class ArraySum
  
  def initialize(collection = [], sum_value = nil) 
    @collection = collection
    @value = sum_value
  end


  def perform_operation
    return 'wrong input' if @collection.empty? or @value.nil?
    
    @collection.sort!

    list = _find_pair
  
    puts "collections: #{list}"
    
  end

  private

  def _find_pair
    left_index = 0
    right_index = @collection.size - 1
    list = [] 
    while left_index < right_index
      pair_value = _pair_value(left_index, right_index)
      if pair_value == @value
        list << "{#{@collection[left_index]}, #{@collection[right_index]}}"
        left_index += 1
      elsif pair_value < @value
        left_index += 1
      elsif pair_value > @value
        right_index -= 1
      end
    end

    return list

  end

  def _pair_value(left_index, right_index)
    @collection[left_index] + @collection[right_index]
  end

end

as = ArraySum.new([10,2,1,3,4,5,6,8,9,7], 6)

puts as.perform_operation
