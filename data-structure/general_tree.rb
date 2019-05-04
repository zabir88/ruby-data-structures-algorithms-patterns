class Node
  attr_reader :value, :id, :parent_id, :children
  def initialize (val, id, parent_id = nil)
    @value = val
    @id = id
    @parent_id = parent_id
    @children = []
  end
end

class GeneralTree
  attr_accessor :root
  
  def initialize(node)
    @root = node
  end

  def insert(node)
    q = []
    q.push(@root)
    while(q.length > 0)
      current_node = q.shift
      if(node.parent_id == current_node.id)
        current_node.children.push(node)
        break
      else
        for i in current_node.children
          q.push(i)
        end
      end
    end
  end

  def breadth_first_traversal
    return if @root.nil?
    q = []
    q.push(@root)
    while (q.length > 0)
      current_node = q.shift
      if(current_node.children.length > 0)
        for i in current_node.children
          q.push(i)
        end
      end
    end
  end

  def depth_first_in_order_traversal
  end

  def depth_first_pre_order_traversal
  end

  def depth_first_post_order_traversal
  end
end

sample = [
  {value: 35349, id: 1, parent_id: nil},
  {value: 24234, id: 2, parent_id: 1},
  {value: 12367, id: 3, parent_id: 2},
  {value: 34334, id: 4, parent_id: 1}
]

for i in 0..sample.length-1
  node = Node.new(sample[i][:value], sample[i][:id], sample[i][:parent_id])
  if (node.parent_id == nil)
    tree = GeneralTree.new(node)
  else
    tree.insert(node)
  end
end

p tree.root


