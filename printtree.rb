Node = Struct.new(:value, :left, :right)

root = Node.new(1, nil, nil)
n2 = Node.new(2, nil, nil)
n3 = Node.new(3, nil, nil)
n4 = Node.new(4, nil, nil)
n5 = Node.new(5, nil, nil)
n6 = Node.new(6, nil, nil)
n7 = Node.new(7, nil, nil)
n8 = Node.new(8, nil, nil)
n9 = Node.new(9, nil, nil)

root.left = n3
root.right = n5
n3.left = n2
n3.right = n4
n5.right = n7
n2.left = n9
n2.right = n6
n4.right = n8

class Printtree
    attr_accessor :root
    def initialize(root)
        @root = root
    end
    
    def execute
        puts "#{root.value}"
        output = {}
        traverse_nodes(root, 1, output)
        print_nodes(output)
    end
    
    def traverse_nodes(node, level, output)
        left_value = node.left ? node.left.value : nil
        right_value = node.right ? node.right.value : nil
        child_values = "#{left_value} #{right_value}".strip
        output[level] = "#{output[level]} #{child_values}".strip
        traverse_nodes(node.left, level+1, output) if node.left
        traverse_nodes(node.right, level+1, output) if node.right
    end
    
    def print_nodes(hash)
        hash.each { |k,v| puts "#{v}" }
    end
end

Printtree.new(root).execute
