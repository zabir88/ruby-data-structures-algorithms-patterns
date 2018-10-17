#Queue implementation with Doubly Linked List
class QueueWithDoublyLinkedList
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

   def shift
    if(@length > 1)
      @head = @head[:next]
      @head[:prev] = nil
      @length -= 1
    else
      @head, @tail, @length = nil, nil, 0
    end
  end
  
  alias enqueue append
  alias dequeue shift
end

##### Hash Table #####
# append/unshift: O(1)
# pop/shift: O(1)
# find: O(1)
##### Hash Table #####

#Queue implementation with HashTable
class QueueWithHashTable
  attr_reader :store, :length

  def initialize
    @store, @start, @end, @length = {}, -1, -1, 0
  end 

  def append(val)
    @end += 1
    @length += 1
    @store[@end] = val
  end

  def shift
    if(@length > 1)
      @start += 1
      @length -= 1
      val = @store[@start]
      @store.delete(@start)
      return val
    else 
      @store, @start, @end, @length = {}, -1, -1, 0
    end
  end 
  
  alias enqueue append
  alias dequeue shift
end

x = QueueWithDoublyLinkedList.new
x.enqueue(1)
p x
x.enqueue(2)
p x
x.dequeue
p x
x.dequeue
p x


# y = QueueWithHashTable.new
# y.enqueue(1)
# p y
# y.enqueue(2)
# p y
# y.dequeue
# p y
# y.dequeue
# p y
# y.enqueue(3)
# p y
