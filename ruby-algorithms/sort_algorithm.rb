require 'byebug'

module SortAlgorithm
  
  def self.bubble_sort(arr)
  end
  ################################################################

  def self.selection_sort  
  end
  ################################################################

  def self.merge_two_sorted_arrays(arr1, arr2)
    # Data Structure: Arrays
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    ind_small, ind_big, result = 0, 0, []
    arr_big = arr1.length > arr2.length ? arr1 : arr2 
    arr_small = arr1.length > arr2.length ? arr2 : arr1 
    
    while (ind_big < arr_big.length && ind_small < arr_small.length)
      if(arr_small[ind_small] < arr_big[ind_big])
        arr_big.insert(ind_big, arr_small[ind_small])
        ind_small += 1
      end
      ind_big += 1
    end

    while(ind_small < arr_small.length)
      arr_big << arr_small[ind_small]
      ind_small += 1
    end

    arr_big
  end
  ################################################################

  def self.group_anagrams(arr)
    result = Hash.new {|h,k| h[k]=[]}

    for i in 0..arr.length-1
      key = arr[i].split(//).sort.join # O(nlogn)
      result[key] << arr[i]  # O(n)
    end
    result.values
  end
  ################################################################
end

p SortAlgorithm.group_anagrams(['cat', 'rat', 'act', 'art', 'tar', 'tac'])
=begin
Sort the words in a given sentence by length
def sort_string(string)
  array= string.split
  return array.sort_by{|word| word.length}.join(" ")
end
puts sort_string("Sort words in a sentence")
=end