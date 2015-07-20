class Twosum
    attr_accessor :data
    
    def initialize(data)
        @data = data.sort
    end
    
    def execute(input)
        index = data.length / 2
        
        result = false
        if check_sum(data[index], data[index+1], input)
            result = true
        else
            if input > data[index] + data[index+1]
                for i in index+1..data.length-1
                    result = check_sum(data[i], data[i+1], input) if data[i+1]
                    break if result
                end
            else
                index.downto(1) do |i|
                    result = check_sum(data[i], data[i-1], input) if data[i-1]
                    break if result
                end
            end
        end
        puts "result is #{result}"
    end
    
    def check_sum(num1, num2, input)
        num1 + num2 == input
    end
end

