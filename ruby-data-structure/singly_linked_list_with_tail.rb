###### Array #########
# append: O(n)
# pop: O(1)
# prepend: O(n) 
# shift: O(n)
# access element: O(1)
# insert element: O(n)
# delete element: O(n)
# search : O(n)

###### Singly Linked List #########
# append: O(1)
# pop: O(n)
# prepend: O(1) 
# shift: O(1)
# access element: O(n)
# insert element: O(n)
# delete element: O(n)
# find : O(n)

class Node
  attr_accessor :value, :next
  def initialize(val = nil)
      @value = val
      @next = nil
  end
end

class SinglyLinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = @head
  end

  def append(val)
    if(@head == nil)
      @head = Node.new(val)
      @tail = @head
    else
      node = Node.new(val)
      @tail.next = node
      # update tail
      @tail = node
    end
  end

  def pop
    current_node = @head
    # empty list
    return nil if current_node == nil
    # single element in list
    if(current_node.next == nil)
      @head = nil
      @tail = nil
      return current_node
    end
    while(current_node.next != nil)
      previous_node = current_node
      current_node = current_node.next
    end
    previous_node.next = nil
    # update tail
    @tail = previous_node
    current_node
  end

  def prepend(val)
    node = Node.new(val)
    if @head == nil
      @head = Node.new(val)
      @tail = @head
    else
      prev_head = @head
      @head = node
      @head.next = prev_head
    end
  end

  def shift
    if @head == nil
      @tail = nil
      return nil
    end
    @head = @head.next
    if @head == nil
      @tail = nil
    end
  end

  # def get(ind)
  #   if(ind >= 0 && ind < @length)
  #     current_node = @head
  #     i = 0
  #     while(i != ind)
  #       current_node = current_node.next
  #       i += 1
  #     end
  #     current_node.value
  #   else
  #    return  nil
  #   end
  # end

  def insert(val, index)
    current_node = @head
    ind = 0
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
    # if value is the first element
    if(@head.value == val)
      @head = @head.next
      return current_node
    end
    while(current_node.value != val)
      previous_node = current_node
      current_node = current_node.next
      break if current_node == nil
    end
    # value not found
    return nil if current_node == nil
    previous_node.next = current_node.next
    # if value is the last element
    if current_node.next == nil
      @tail = previous_node
    end
    current_node
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

  def reverse
    prev_node = nil
    current_node = @head
    next_node = nil
    while(current_node != nil)
      next_node = current_node.next
      current_node.next = prev_node
      prev_node = current_node
      current_node = next_node
    end
    find_tail = @head
    while(find_tail != nil)
      second_last_node = find_tail 
      find_tail = find_tail.next
    end
    @tail = second_last_node
    current_node = prev_node
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
first = SinglyLinkedList.new
first.append(1)
first.append(2)
first.append(3)
first.reverse
p first


