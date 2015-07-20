array = [4,1,2,3,4,5,6,5,4,3,4,4,4,4,4,4,4]
array2 = [1,2,3,4,3,2,1]
array3 = [4,1,2,3,4,3,2,1,4,4,4]

class Palindrome
  attr_accessor :array
  def initialize(array)
    @array = array
  end

  def execute
    new_array = [nil, nil]
    i = 0
    j = @array.length - 1
    while i <= j
      if i == j
        new_array.insert(i+1, @array[i]) if i+1 == new_array.length / 2
        i += 1
      elsif @array[i] == @array[j]
        new_array.insert((new_array.length/2), @array[j])
        j -= 1
      elsif @array[i] == new_array[i+1]
        new_array.insert(i+1, @array[i])
        i += 1
      elsif @array[j] == new_array[i]
        new_array.insert(i+1, @array[j])
        j -= 1
      else
        j -= 1
      end
    end
    new_array = new_array.compact
    puts "#{new_array }, length: #{new_array.length}"
  end
end

Palindrome.new(array).execute
Palindrome.new(array2).execute
Palindrome.new(array3).execute
