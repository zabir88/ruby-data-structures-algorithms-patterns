#Stack implementation with Doubly Linked List
class StackWithDoublyLinkedList
  attr_reader :head, :tail, :length
  
  def initialize
    @node = {value: nil, prev: nil, next: nil}
    @head, @tail, @length = nil, nil, 0
  end

  def append()
  end

  def pop
  end
end

##### Hash Table #####
# append/unshift: O(1)
# pop/shift: O(1)
# find: O(1)
##### Hash Table #####

# Stack implementation with HashTable
class StackWithHashTable
  attr_reader :store
  def initialize(length)
    @store = {} 
    @position, @length, @entries = -1, length, 0
  end

  #LIFO(Last In First Out)
  def append(val)
    if(@entries != @length)
      @position += 1
      @entries += 1
      @store[@position] = val
    end 
  end

  def pop
    if(@length > 1) 
      val = @store[@position]
      @store.delete(@position)
      @position -= 1
      @length -= 1
      return val
    else
      @store, @position, @length = {}, -1, 0
    end
  end
end

# x = StackWithDoublyLinkedList.new
# x.append(1)
# p x
# x.append(2)
# p x
# x.pop
# p x
# x.pop
# p x
# x.append(3)
# p x

y = StackWithHashTable.new
y.append(1)
p y.store
y.append(2)
p y.store
y.pop
p y.store
y.pop
p y.store
y.append(3)
p y.store
