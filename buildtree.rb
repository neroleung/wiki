Node = Struct.new(:value, :left, :right)

class Buildtree
    attr_accessor :list
    def initialize(list)
        @list = list
    end
    
    def execute
        hash = {}
        root_id = -1
        list.each do |data|
            child_value = data[0]
            parent_value = data[1]
            is_left = data[2]
            
            if parent_value
                hash[parent_value] = hash[parent_value] ? hash[parent_value] : Node.new(parent_value)
                hash[child_value] = hash[child_value] ? hash[child_value] : Node.new(child_value)
                is_left ? hash[parent_value].left = hash[child_value] : hash[parent_value].right = hash[child_value]
            else
                root_id = child_value
                hash[child_value] = hash[child_value] ? hash[child_value] : Node.new(child_value)
            end
        end
        
        values = { 0 => "#{hash[root_id].value}" }
        traverse_tree(hash[root_id], 1, values)
        
        values.each { |k,v| puts v }
    end
    
    def traverse_tree(node, level, values)
        left_value = node.left.value if node.left
        right_value = node.right.value if node.right
        child_values = "#{left_value} #{right_value}".strip
        
        values[level] = "#{values[level]} #{child_values}".strip
        
        traverse_tree(node.left, level + 1, values) if node.left
        traverse_tree(node.right, level + 1, values) if node.right
    end
end

list = [
[15, 20, true],
[19, 80, true],
[17, 20, false],
[16, 80, false],
[80, 50, false],
[50, nil, false],
[20, 50, true]
]


Buildtree.new(list).execute
