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

class HeadOnlySinglyLinkedList
  attr_reader :head
  
  def initialize
    @head = nil
  end

  def append(val)
    if(@head == nil) 
      @head = Node.new(val)
    else
      current_node = @head
      while(current_node.next != nil)
        current_node = current_node.next
      end
      current_node.next = Node.new(val)
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
    return @head = Node.new(val) if @head == nil
    node = Node.new(val)
    prev_head = @head
    @head = node
    @head.next = prev_head
  end

  def shift
    return @head = nil if @head == nil
    @head = @head.next
  end

  def find(val)
    return nil if @head == nil
    current_node = @head
    while(current_node.value != val)
      current_node = current_node.next
      break if current_node == nil
    end
    current_node
  end

  def insert(val, index)
    ind = 0
    current_node = @head
    while(ind != index)
      previous_node = current_node
      current_node = current_node.next
      ind += 1
    end
    node = Node.new(val)
    previous_node.next = node
    node.next = current_node
  end
  
  def delete(val)
    return nil if @head == nil
    current_node = @head
    if (@head.value == val)
      @head = @head.next
      return current_node
    end
    while(current_node.value != val)
      previous_node = current_node
      current_node = current_node.next
      break if current_node == nil
    end
    return nil if current_node == nil
    previous_node.next = current_node.next
    current_node
  end

  def reverse
    previous_node = nil
    current_node = @head
    next_node = nil
    while(current_node != nil) 
      next_node = current_node.next
      current_node.next = previous_node
      previous_node = current_node
      current_node = next_node
    end
    previous_node
  end 

  def is_empty?
    @head == nil ? true : false
  end 

  def length
    count = 0
    current_node = @head
    while(current_node != nil)
      count += 1
      current_node = current_node.next
    end
    count
  end
end

first = HeadOnlySinglyLinkedList.new
first.append(1)
first.append(2)
first.append(3)
p first.reverse
p first




