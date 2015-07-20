class CalculateRPN
    attr_accessor :formula
    def initialize(formula)
        @formula = formula
    end
    
    def execute
        result = nil
        numbers = []
        
        0.upto(formula.length-1) do
            arg = formula.shift
            if arg.is_a?(Numeric)
                numbers << arg
            else
                if result
                    result = result.send(arg, numbers.pop)
                else
                    num2 = numbers.pop
                    num1 = numbers.pop
                    result = num1.send(arg, num2)
                end
            end
        end
        
        puts "result for #{formula} is #{result}"
    end
end

f1 = [4, 1, '+', 2.5, '*']
f2 = [5, 80, 40, '/', '+']

CalculateRPN.new(f1).execute
CalculateRPN.new(f2).execute
