

data = [[-10, -1], [0, 2], [4, 10]]
interval = [-5, 1]

class Inserter
    attr_accessor :data

    def initialize(data)
        @data = data
    end
    
    def execute(interval)
        insert(interval)
        merge
    end
    
    def insert(interval)
        index = data.each_with_index do |data_int, i|
            if interval.first <= data_int.first
                break i
            end
            i + 1 if i == data.length
        end
        data.insert(index, interval)
    end
    
    def merge
        new_data = [data.shift]
        index = 0
        data.each_with_index do |data_int, i|
            if data_int.first <= new_data[index].first && data_int.last >= new_data[index].last
                new_data[index] = data_int
            elsif data_int.first <= new_data[index].first && data_int.last < new_data[index].last
                new_data[index] = [data_int.first, new_data[index].last]
            elsif data_int.first > new_data[index].first && data_int.last >= new_data[index].last && data_int.first < new_data[index].last
                new_data[index] = [new_data[index].first, data_int.last]
            else
                new_data = new_data + [data_int]
                index = index + 1
            end
        end
        new_data
    end
end

puts "Result = #{Inserter.new(data).execute(interval)}"
