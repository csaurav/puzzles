# Find duplicate values in an integer"
# Implementation done using hash
#
class DuplicateArray

  attr_accessor :list

  def initialize(collection)
    @list = collection
    @no_of_elements = {}
  end


  def show
    _create_hash_values
    duplicates = @no_of_elements.select {|key, value| value > 1}   
    #puts duplicates  
  end

  private
  # create a hash with the count of different elements in the array
  
  def _create_hash_values
    @list.sort!

    @list.each do |element|
      if @no_of_elements.keys.include? element
        @no_of_elements[element] += 1
      else
        @no_of_elements[element] = 1
      end
    end
  end
end


da = DuplicateArray.new [2,1,10,100,2,100,1,1,4,5,4] 

puts da.show




