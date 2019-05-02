###### Big O ######
# append: O(n)
# pop: O(n)
# prepend: O(1)
# shift: O(1)
# access element: O(n)
# insert element: O(n)
# delete element: O(n)
# search: O(n)

class Node
  attr_accessor :value, :next, :prev
  def initialize(value = nil)
    @value = value
    @prev = nil
    @next = nil
  end
end

class DoublyLinkedList 
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(val)
    node = Node.new(val)
    # when empty list
    return @head = node if @head == nil
    # when not empty list
    current_node = @head
    while(current_node.next != nil)
      current_node = current_node.next
    end
    node.prev = current_node
    current_node.next = node
  end

  def pop
    current_node = @head
    # when empty list
    return nil if current_node == nil
    # when single element in list
    if(current_node.next  == nil)
      last_element = current_node
      @head = nil
      return last_element
    end
    # when multiple elements in list
    while(current_node.next != nil)
      previous_node = current_node
      current_node = current_node.next
    end
    previous_node.next = nil
    current_node
  end

  def prepend(val)
    node = Node.new(val)
    #when empty list
    return @head = node if @head == nil
    #when not empty list
    prev_head = @head
    prev_head.prev = node
    @head = node
    node.next = prev_head
  end

  def shift
    # when empty list
    return nil if @head == nil
    # when not empty list
    result = @head
    @head = @head.next
    @head.prev = nil
    result
  end

  def insert(val, index)
    node = Node.new(val)
    current_node = @head
    ind = 0
    while(ind != index)
      ind += 1
      current_node = current_node.next
      break if current_node == nil
    end
    return nil if current_node == nil
    prev_node = current_node.prev
    next_node = current_node.next
    node.prev = prev_node
    node.next = next_node
    prev_node.next = node
    next_node.prev = node
  end

  def delete(val)
    current_node = @head
    # when empty list
    return nil if current_node == nil
    # if first el in the list
    if current_node.value == val
      self.shift
      return current_node
    end
    while(current_node.next != nil)
      if(current_node.value == val)
        break
      end 
      current_node = current_node.next
    end
    # element not found in the list
    return nil if current_node == nil
    # last element in the list
    if(current_node.next == nil)
      self.pop
      return current_node
    end
    # element found in between first and last element in the list
    previous_node = current_node.prev
    next_node = current_node.next
    previous_node.next = next_node
    next_node.prev = previous_node
    current_node
  end

  def find(val)
    # when empty list
    return nil if @head == nil
    # when not empty list
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
    current_node = @head
    prev_node = nil
    while current_node != nil
      next_node = current_node.next
      current_node.next = prev_node
      prev_node = current_node
      prev_node.prev = next_node
      current_node = next_node
    end
    @head = prev_node
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

first = DoublyLinkedList.new
first.append(1)
first.append(2)
first.append(3)
first.reverse
p first




