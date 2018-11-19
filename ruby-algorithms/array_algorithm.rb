require 'byebug'

module ArrayAlgorithm
  
  def self.sum_array_elements(arr)
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    # Data Structure: Array 
    arr.inject{|sum, i| sum+=i}
  end
  ################################################################
  
  def self.join_corresponding_string_elements(str1, str2)
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    # Data Structure: Array 
    arr1 =str1.split(//)
    arr2 =str2.split(//)
    arr = []
    arr = arr1.length > arr2.length ? arr1 : arr2
    result = []
    for i in 0..arr.length-1
      result << [arr1[i], arr2[i]]
    end    
    result.join
  end
  ################################################################

  def self.palindrome(sample)
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    # Data Structure: Array
    arr = sample.downcase.gsub(' ', '').split(//)
    arr.each_index do |index|
      if arr[index] != arr[-index-1]
        return "#{sample} is not a palindrome"
      end
    end
    "#{sample} is a palindrome"
  end
  ################################################################

  def self.reverse_sentence(sentence)
    # Data Structure: Array
    # Time Coplexity: O(n)
    # Space Coplexity: O(n)
    result = []
    input = sentence.split
    for i in 1..input.length
      result << input[-i]
    end
    result.join(' ')
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
end


