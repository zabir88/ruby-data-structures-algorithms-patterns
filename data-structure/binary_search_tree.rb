class Node
  attr_accessor :value, :left_node, :right_node
  
  def initialize(val)
    @value = val
    @left_node = nil
    @right_node = nil
  end
end


class BinarySearhTree
  attr_reader :root
  
  def initialize(value = nil)
    @root = Node.new(val)
  end

  def depth_first_in_order
  end

  def breadth_first
  end


  def insert(node = @root, val)
    if(val > node.value)
      if(node.right_node == nil)
        node.right_node = Node.new(val) 
      else
        insert(node.right_node, val)
      end
    else
      if(node.left_node == nil)
        node.left_node = Node.new(val)
      else
        insert(node.left_node, val)
      end
    end
    @root 
  end

  def contains?(node = @root, val)
    if(node.value == val)
      return true 
    elsif(val < node.value)
      if(node.left_node != nil && node.left_node.value == val)
        return true
      elsif(node.left_node == nil)
        return false
      else
        contains?(node.left_node, val)
      end
    else
      if(node.right_node != nil && node.right_node.value == val)
        puts node.value
        return true
      elsif(node.right_node == nil)
        return false
      else
        contains?(node.right_node, val)
      end
    end
    return "doesnot exist" 
  end

  def check_depth
  end

  def pre_order_traversal
  end

  def post_order_traversal
  end
  
end

first = BinarySearhTree.new(5)
first.insert(2)
first.insert(7)
first.insert(4)
first.insert(8)
first.insert(1)
first.insert(6)
first.insert(3)
p first.contains?(4)


