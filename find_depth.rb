s1 = '(00)' # 0
s2 = '((00)0)' # 1
s3 = '((00)(00))' # 1
s4 = '((00)(0(00)))' # 2
s5 = '((00)(0(0(00))))' # 3
s6 = 'x' # -1
s7 = '0' # -1
s8 = '()' #  -1
s9 = '(0)' # -1
s10 = '(00)x' # -1
s11 = '(0p)' # -1
s12 = '((00)(0(0(0x))))' # 3

class FindDepth
  def initialize(input)
    root = input.scan(/^\((.*)\)$/).flatten.first
    depth = -1
    depth += travel(root)

    puts "result of #{input} is #{depth}"
  end

  def travel(node)
    return -1 if node == nil
    childrens = node.scan( /^(0)(\((.*)\)|0)$|\((.*)\)\((.*)\)$|\((.*)\)(0)$/ ).flatten.compact

    left_level = 1
    right_level = 1

    if childrens.first != '0'
      left_level += travel(childrens.first)
    end

    if childrens.last != '0'
      right_level += travel(childrens.last)
    end

    if left_level > 0 && right_level > 0
      [left_level, right_level].max
    else
      -1
    end
  end
end

FindDepth.new(s1)
FindDepth.new(s2)
FindDepth.new(s3)
FindDepth.new(s4)
FindDepth.new(s5)
FindDepth.new(s6)
FindDepth.new(s7)
FindDepth.new(s8)
FindDepth.new(s9)
FindDepth.new(s10)
FindDepth.new(s11)
FindDepth.new(s12)
