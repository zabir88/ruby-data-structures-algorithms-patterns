require 'byebug'

class Node
  attr_accessor :value, :id, :parent_id, :children
  def initialize (val:, id:, parent_id:)
    @value = val
    @id = id
    @parent_id = parent_id
    @children = []
  end
end

class GeneralTree
  attr_reader :root
  
  def initialize(node = nil)
    @root = node
  end

  def breadth_first_search
    return nil if @root == nil
    q = []
    q.push(@root)
    while (q.length > 0)
      current_node = q.shift
      if current_node.children.length > 0
        for i in current_node.children
          q.push(i)
        end
      end
    end
  end

  def insert(node)
    return nil if @root == nil
    q = []
    q.push(@root)
    while(q.length > 0)
      current_node = q.shift
      if current_node.id == node.parent_id
        current_node.children.push(node)
        break
      else
        for i in current_node.children
          q.push(i)
        end
      end
    end
  end

  def find(val)
    return nil if @root == nil
    return @root if @root.value == val
    q = []
    q.push(@root)
    while(q.length > 0)
      current_node = q.shift
      if current_node.value == val
        return current_node
      else
        for i in current_node.children
          q.push(i)
        end
      end
    end
    nil
  end

  def delete(val)
    return nil if @root == nil
    q = []
    parent_node = nil
    q.push(@root)
    while q.length > 0
      current_node = q.shift
      if current_node.value == val && current_node.parent_id == nil
        @root = nil
      elsif current_node.value == val
        parent_node.children.delete(current_node)
        return current_node
      else
        for i in current_node.children
          parent_node = current_node
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
# Sample Data
data = [
  {name: 'Kashem', id: 1, parent_id: nil},
  {name: 'Hakim', id: 2, parent_id: 1},
  {name: 'Abul', id: 3, parent_id: 1},
  {name: 'Rana', id: 4, parent_id: 2},
  {name: 'Zabir', id: 5, parent_id: 3},
  {name: 'Maryam', id: 6, parent_id: 5} 
]
# Initialize Tree
root_node = Node.new(val: data.first[:name], id: data.first[:id], parent_id: data.first[:parent_id])
tree = GeneralTree.new(root_node)

# Insert nodes in Tree
for i in 1..data.length-1
  node = Node.new(val: data[i][:name], id: data[i][:id], parent_id: data[i][:parent_id])
  tree.insert(node)
end

p tree.delete('Zabir')
# p tree.find('Abul')

