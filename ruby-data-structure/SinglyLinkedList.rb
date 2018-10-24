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

###### Singly Linked List #########
# append: O(1)
# prepend: O(1) 
# pop: O(n) 
# shift: O(1)
# access element: O(n)
# insert element: O(1)
# delete element: O(1)
# search : O(n)
##### Singly Linked List #########


class SinglyLinkedList
  attr_reader :head, :tail, :length
  
  def initialize
    @head, @tail, @length = nil, nil, 0
  end

  def append(val)
    node ={value: val, next: nil}
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
      current_node = @head
      while (current_node != @tail )
        previous_node = current_node
        current_node = current_node[:next]
      end
      previous_node[:next] = nil
      @tail = previous_node
      @length -= 1
    else
      @head, @tail, @length = nil, nil, 0
    end
  end

  def unshift(val)
    node = {value: val, next: @head}
    if (@length == 0)
      @head, @tail = node, node
    else
      @head = node
    end
    @length += 1
  end

  def shift
    if (@length > 1)
      @head = @head[:next]
      @length -= 1
    else
       @head, @tail, @length = nil, nil, 0
    end
  end

  def get(index)
    if(index == 0)
      @head[:value]
    elsif (index == @length-1)
      @tail[:value]
    elsif(index > 0  && index < @length-1)
      current_node = @head
      i = 0
      while(i != index)
        i += 1
        current_node = current_node[:next]
      end
      current_node[:value]
    else
      return nil 
    end
  end

  def set(val, index)
    node = {value: val, next: nil}
    current_node = @head
    i = 0
    while(i != index)
      i += 1
      previous_node = current_node
      current_node = current_node[:next]
    end
    previous_node[:next] = node
    node[:next] = current_node
    @length += 1
  end

  def remove(index)
    current_node = @head
    i = 0
    while(i != index)
      i += 1
      previous_node = current_node
      current_node = current_node[:next]
    end
    previous_node[:next] = current_node[:next] 
    @length -= 1
  end
end

x = SinglyLinkedList.new
x.append(1)
p x
x.append(2)
p x 
x.append(3)
x.append(4)
p x
p x.get(2)





