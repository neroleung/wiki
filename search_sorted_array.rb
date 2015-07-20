class SearchSortedArray
    attr_accessor :array, :rotation
    def initialize(array, rotation=0)
        @array = array
        @rotation = rotation
    end
    
    def execute(input)
        index = search(input, 0 + rotation, array.length - 1 + rotation)
        puts "index found at: #{index}"
    end
    
    def search(input, start_at, end_at)
        return -1 if start_at > end_at
        mid = (start_at + end_at) / 2
        
        if input == array[mid % array.length]
            mid % array.length
        elsif mid + 1 == array.length
            -1
        elsif input > array[mid % array.length] 
            search(input, mid + 1, end_at)
        else
            search(input, start_at, mid-1)
        end
    end
end

a1 = [1,2,3,4,5,6,7,8]

SearchSortedArray.new(a1).execute(0)   
SearchSortedArray.new(a1).execute(1)    
SearchSortedArray.new(a1).execute(2)
SearchSortedArray.new(a1).execute(3)
SearchSortedArray.new(a1).execute(4)
SearchSortedArray.new(a1).execute(5)
SearchSortedArray.new(a1).execute(6)
SearchSortedArray.new(a1).execute(7)
SearchSortedArray.new(a1).execute(8)
SearchSortedArray.new(a1).execute(9)

a2 = [4,5,6,7,8,1,2,3]

SearchSortedArray.new(a2,5).execute(0)   
SearchSortedArray.new(a2,5).execute(1)    
SearchSortedArray.new(a2,5).execute(2)
SearchSortedArray.new(a2,5).execute(3)
SearchSortedArray.new(a2,5).execute(4)
SearchSortedArray.new(a2,5).execute(5)
SearchSortedArray.new(a2,5).execute(6)
SearchSortedArray.new(a2,5).execute(7)
SearchSortedArray.new(a2,5).execute(8)
SearchSortedArray.new(a2,5).execute(9)
