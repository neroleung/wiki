class Flowerbed
    attr_accessor :bed
    def initialize(bed)
        @bed = bed
    end
    
    def execute(input)
        bed.each_with_index do |plotted, i|
            break if input == 0
            if !plotted && check_plottable(i)
                bed[i] = true
                input = input - 1
            end
        end
        puts "result: #{input == 0}, #{bed}"
    end
    
    def check_plottable(pos)
        if pos == 0 && pos + 1 < bed.length
            !bed[pos + 1]
        elsif pos > 0 && pos + 1 < bed.length
            !bed[pos - 1] && !bed[pos + 1]
        elsif pos > 0 && pos + 1 == bed.length
            !bed[pos - 1]
        else
            true
        end 
    end
end

