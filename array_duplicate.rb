## Given an array, remove all duplicate array
#

class DuplicateArray
  def initialize(collection)
    @list = collection
    _sort
  end


  def remove_duplicates
    _remove_values
  end

  private 

  def _remove_values
    seen_values = []

    @list.each_with_index do |value, index|
      if seen_values.include? value
        @list.delete_at(index)
      else
        seen_values << value        
      end
   end

   @list 
  end

  def _sort
    @list.sort!
  end
end


value_1 = [10,2,4,9,10,2,1]
da = DuplicateArray.new(value_1)
puts da.remove_duplicates
