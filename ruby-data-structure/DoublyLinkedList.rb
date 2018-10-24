###### Array #########
# append: O(n)
# prepend: O(n) 
# pop: O(1) 
# shift: O(n)
# access element: O(1)
# insert element: O(n)
# delete element: O(n)
# search : O(n)
##### Array #########

###### Doubly Linked List ######
# append: O(1)
# prepend: O(1) 
# pop: O(1) 
# shift: O(1)
# access element: O(n)
# insert element: O(1)
# delete element: O(1)
# search: O(n)
###### Doubly Linked List ######

class DoublyLinkedList
  attr_reader :head, :tail, :length
  
  def initialize
    @head, @tail, @length = nil, nil, 0
  end

  def append(val)
    node = {value: val, prev: @tail, next: nil}
    if(@length == 0)
      @head = node
      @tail = @head
    else
      @tail[:next] = node
      @tail = node
    end
    @length += 1
  end

  def pop
    if(@length > 1)  
      @tail = @tail[:prev]
      @tail[:next] = nil
      @length -= 1
    else
      @head, @tail, @length = nil, nil, 0
    end
  end

  def unshift(val)
    node = {value: val, prev: nil, next: @head}
    if(@length == 0)
      @head = node
      @tail = @head
    else
      @head[:prev] = node
      @head = node
    end
    @length += 1
  end

  def shift
    if(@length > 1)
      @head = @head[:next]
      @head[:prev] = nil
      @length -= 1
    else
      @head, @tail, @length = nil, nil, 0
    end
  end

  def get(index)
    current_node = @head
    i = 0
    while(i != index)
      i += 1
      current_node = current_node[:next]
    end
    current_node[:value]
  end

  def set(val, index)
  end

  def remove(index)
  end
end

x = DoublyLinkedList.new
x.append(1)
x.append(2)
x.append(3)
p x
p x.get()
