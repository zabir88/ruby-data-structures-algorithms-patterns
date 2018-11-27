class BinarySearhTree
  attr_accessor :value, :right, :left, :count
  
  def initialize(val)
    @value = val
    @left, @right = nil, nil
  end

  def insert(val)
    if(val > @value)
      if(@right == nil)
        @right = Tree.new(val) 
      else
        @right.insert(val)
      end
    else
      if(@left == nil)
        @left = Tree.new(val)
      else
       @left.insert(val)
      end
    end 
  end

  def contains?(val)
    if(@value == val)
      return true 
    elsif(val < @value)
      if(@left != nil && @left.value == val)
        return true
      elsif(@left == nil)
        return false
      else
        @left.contains?(val)
      end
    elsif(val > @value)
      if(@left != nil && @right.value == val)
        return true
      elsif(@right == nil)
        return false
      else
        @right.contains?(val)
      end
    end
    return false 
  end

  def check_depth
  end

  def pre_order_traverse
  end

  def in_order_traverse
  end

  def post_order_traverse
  end
  
end

first = Tree.new(5)
first.insert(2)
first.insert(7)
first.insert(4)
first.insert(8)
p first.contains?(1)
