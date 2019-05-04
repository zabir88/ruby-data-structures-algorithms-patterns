###### Big O #########
# append: O(n)
# pop: O(n)
# prepend: O(1) 
# shift: O(1)
# insert element: O(n)
# delete element: O(n)
# find element: O(n)
# reverse list: O(n)
class Node
  attr_accessor :value, :next
  
  def initialize(val = nil)
    @value = val
    @next = nil
  end
end

class SinglyLinkedList
  attr_reader :head
  
  def initialize
    @head = nil
  end

  def append(val)
    node = Node.new(val)
    if(@head == nil) 
      @head = node
    else
      current_node = @head
      while(current_node.next != nil)
        current_node = current_node.next
      end
      current_node.next = node
    end
  end

  def pop
    current_node = @head
    # empty list
    return nil if current_node == nil
    # single element in list
    if(current_node.next == nil)
      @head = nil
      return current_node
    end
    while(current_node.next != nil)
      previous_node = current_node
      current_node = current_node.next
    end
    previous_node.next = nil
    current_node
  end

  def prepend(val)
    node = Node.new(val)
    return @head = node if @head == nil
    node.next = @head
    @head = node
  end

  def shift
    return @head = nil if @head == nil
    old_head = @head
    @head = @head.next
    old_head
  end

  def insert(val, index)
    node = Node.new(val)
    ind = 0
    current_node = @head
    while(ind != index)
      previous_node = current_node
      current_node = current_node.next
      ind += 1
    end
    previous_node.next = node
    node.next = current_node
  end
  
  def delete(val)
    current_node = @head
    # if list is empty
    return nil if @head == nil
    # if value is the first element in the list
    if current_node.value == val
      self.shift
      return current_node
    end
    while(current_node.next != nil)
      if(current_node.value == val)
        break
      end
      previous_node = current_node
      current_node = current_node.next
    end
    # if value not found in the list
    return nil if current_node == nil
    # if last element in the list
    if (current_node.next == nil)
      self.pop
      return current_node
    end
    # element found in between first and last element in the list
    previous_node.next = current_node.next
    current_node
  end

  def find(val)
    return nil if @head == nil
    current_node = @head
    while(current_node.next != nil)
      if(current_node.value == val)
        return current_node
      end
      current_node = current_node.next
    end
    nil
  end
  
  def reverse
    previous_node = nil
    current_node = @head
    while(current_node != nil) 
      next_node = current_node.next
      current_node.next = previous_node
      previous_node = current_node
      current_node = next_node
    end
    @head = previous_node
  end 

  def is_empty?
    @head == nil ? true : false
  end 

  def length
    return 0 if @head == nil
    count = 0
    current_node = @head
    while(current_node != nil)
      count += 1
      current_node = current_node.next
    end
    count
  end
end

# first = HeadOnlySinglyLinkedList.new
# first.append(1)
# first.append(2)
# first.append(3)
# p first




