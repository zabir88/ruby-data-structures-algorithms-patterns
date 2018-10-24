# cache = LRUCache.new(3)
# cache.add("a", 1)
# cache.add("b", 2)
# cache.add("c", 3)
# LRU: c b a
# c
# cache.add("b", 7)
# LRU: b c a
# cache.get("a") # => 1
# LRU: a c b
# @most_recent = a
# cache.add("d", 4) # => 1
# cache.get("b") # => nil


# @store = {
#   "a" => Node(1),
#   "b" => Node(2),
# }

# Node(prev: nil, next: Node(2), val: 1)

class LruCache
  attr_reader :store, :length
  
  def initialize(length)
    @store = []
    @length = length
    @capacity = 0
  end
  
  def get(key)
    val = @store.select{|i| i[key]}.first
    @store.delete_if {|i| i[key]} 
    @store.unshift(val) 
    puts val[key]
  end

  def add(key, value)
    if (@capacity == @length )
      @store.delete_if {|i| i.has_key?(key)}
    end
    if(@capacity == @length)
      @store.pop
    end
    add_hash = Hash.new
    add_hash[key] = value
    @store.unshift(add_hash)
    @capacity += 1
  end
end

cache = LruCache.new(3)
cache.add('a', 1)
p cache.store
cache.add('b', 2)
p cache.store
cache.add('c', 3)
p cache.store
cache.add('d', 7)
p cache.store
cache.get('c')
p cache.store






