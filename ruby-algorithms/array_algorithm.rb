require 'byebug'

module ArrayAlgorithm  
  def self.join_corresponding_string_elements(str1, str2)
    # Brute force solution: Iterate through both arrays at the same time and end iteration for the bigger string and keep pushing the elements from both arrays in a new array making the new array 2D. Then join all the inner arrays.
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    # Data Structure: Array 
    result = []
    if(str1.length > str2.length)
      for i in 0..str1.length-1
        result << [str1[i], str2[i]]
      end
    else
      for i in 0..str2.length-1
        result << [str1[i], str2[i]]
      end 
    end   
    result.join
  end
  ################################################################

  def self.palindrome(str)
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    # Data Structure: String
    for index in 0..str.length-1
      if str[index] != str[-index-1]
        return "#{str} is not a palindrome"
      end
    end
    "#{str} is a palindrome"
  end
  ################################################################

  def self.reverse_sentence(sentence)
    # Brute force solution: Iterate through the array and push arr[-i-1] to a new array called result.
    # Data Structure: Array
    # Time Coplexity: O(n)
    # Space Coplexity: O(n)
    
    # Optmized Solution
    # Data Structure: Array
    # Time Coplexity: O(n)
    # Space Coplexity: O(n)
    arr = sentence.split
    front, back = 0, arr.length-1
    while(front < back)
      temp = arr[front]
      arr[front] = arr[back]
      arr[back] = temp
      front += 1
      back -= 1
    end
    arr
  end
  ################################################################

  def self.sort_by_price_ascending(json_string)
    # input: '[{"name":"eggs","price":1},{"name":"coffee","price":9.04},{"name":"banana","price":1}, {"name":"rice","price":4.04}]'
    # Data Structure: Array
    # Time Complexity: O(n log n) provided sort_by uses quick sort
    # Space Complexity: O(log n) provided sort_by uses quick sort
    require 'json'
    input = JSON.parse(json_string)
    input = input.sort_by{|a| [a['price'], a['name']] }
    JSON.generate(input)
  end
  ################################################################

  def self.tictactoe_game_over?(arr)
    # Optimized Solution
    # Data Structure: 2D Array
    # Time Complexity: O(n)
    # Space Complexity: O(1)

    # check rows
    for r in 0..2
      if(arr[r][0] == arr[r][1] && arr[r][1] == arr[r][2] && arr[r][0] == arr[r][2])
        return true 
      end  
    end
    #check columns
    for c in 0..2
      if(arr[0][c] == arr[1][c] && arr[1][c] == arr[2][c] && arr[0][c] == arr[2][c])
        return true
      end
    end
    #check left diagonal
    if(arr[0][0] == arr[1][1] && arr[1][1] == arr[2][2] && arr[0][0] == arr[2][2])
      return true
    end
    #check right diagonal
    if(arr[0][2] == arr[1][1] && arr[1][1] == arr[2][0] && arr[0][2] == arr[2][0])
      return true
    end
    return false
  end
  ################################################################
  
  def self.cycle_in_array?(arr)
    # Optimized Solution
    # Data Structure: Array
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    
    # Assumption no elements is greater than arr.length - 1
    i, j = 0, 0 
    while(true)
      if(i < 0 || j < 0 || i >= arr.length || j>=arr.length )
        return false
      end
      i = arr[i]
      if(i == j)
        return true
      end
      if(i < 0 || i >= arr.length)
        return false
      end
      i = arr[i]
      if(i == j)
        return true
      end
      j = arr[j]
      if(j == i)
        return true
      end
    end
  end
  ################################################################
  
  def self.find_intersection_between_arrays()
    # Brute force solution: Loop through 3 arrays and save the result in a new array
    # Time Complexity: O(n^3)
    # Space Complexity: O(n)
    
    #Optimized Solution
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    
  end
  ################################################################

end

p ArrayAlgorithm.palindrome('racecar')

