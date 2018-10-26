require 'byebug'

module StackQueueAlgorithm
  
  def self.isBalanced(string)
    # Data Structure: Array
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    stack = []
    string = string.split(//) 
    for i in 0..string.length-1
      stack << ')' if string[i] == '('
      stack << '}' if string[i] == '{'
      stack << ']' if string[i] == '['
        
      if(string[i] == ')' || string[i] == '}' || string[i] == ']')
        if(stack.last == string[i])
          stack.pop
        else
          stack << string[i]
        end
      end
    end

    return 'YES' if stack.length == 0
    return 'NO' if stack.length != 0
  end
  ################################################################

end

