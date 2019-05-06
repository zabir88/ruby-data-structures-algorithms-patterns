# Explicit Iterator Pattern
class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end
  
  def has_next?
    @index < @array.length
  end
  
  def get
    @array[@index]
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

i = ArrayIterator.new([1,2,3])
while (i.has_next?)
  p i.next_item
end

