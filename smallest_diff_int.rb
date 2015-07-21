a1 = [1,2,3]
a2 = [4,5]

a3 = [-3,-2,-1]
a4 = [-5,-4]

a5 = [1,2,3]
a6 = [-5,-4]

a7 = [-3,-2,-1]
a8 = [4,5]

a9 = [1,3,5]
a10 = [2,6,9]

class SmallestDiffInt
  def initialize(a1, a2)
    i,j = 0,0
    diff = (1 << 31) - 1
    while i < a1.length && j < a2.length
      if a1[i] <= a2[j]
        diff = [a2[j] - a1[i], diff].min
        i+=1
      else
        diff = [a1[i] - a2[j], diff].min
        j+=1
      end
    end
    puts "diff = #{diff.abs}"
  end
end

SmallestDiffInt.new(a1,a2)
SmallestDiffInt.new(a3,a4)
SmallestDiffInt.new(a5,a6)
SmallestDiffInt.new(a7,a8)
SmallestDiffInt.new(a9,a10)
