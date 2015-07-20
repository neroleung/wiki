class AHundredGame
  attr_accessor :n, :max


  def initialize(n, max)
    @n = n
    @max = max
  end

  def execute
    stack = (1..n).to_a

    can_i_win = next_move(stack, true, 0)
  end

  def next_move(stack, my_turn, current_total)
    pick = stack[stack.length-1] # try the largest number first
    if pick + current_total >= max
      return my_turn
    else
      if stack[stack.length - 2] && pick + current_total + stack[stack.length - 2] >= max
        pick = stack.shift # pick the smallest number
        current_total += pick
        next_move(stack, !my_turn, current_total)
      else
        pick = stack.pop # pick the largest number
        current_total += pick
        next_move(stack, !my_turn, current_total)
      end
    end
  end
end

