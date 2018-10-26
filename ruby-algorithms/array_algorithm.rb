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

  def self.merge_two_sorted_arrays(array1, array2)
    # Data Structure: Arrays
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    array1, array2 = array1.sort, array2.sort
    array1_index, array2_index = 0, 0
    result = []
    while(array1_index < array1.length && array2_index < array2.length)
      if (array1[array1_index] < array2[array2_index])
        result << array1[array1_index]
        array1_index += 1
      else
        result << array2[array2_index]
        array2_index += 1
      end
    end
    while( array1_index < array1.length )
      result << array1[array1_index]
      array1_index += 1
    end 
    while( array2_index < array2.length )
      result << array2[array2_index]
      array2_index += 1
    end 
    result
  end
  ################################################################

  def self.reverse_sentence(sentence)
    # Data Structure: Array
    # Time Coplexity: O(n)
    # Space Coplexity: O(1)
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
end


