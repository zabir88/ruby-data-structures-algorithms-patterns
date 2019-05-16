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
    # Space Complexity: O(1)
    ind_small, ind_big = 0, 0
    if(arr1.length == arr2.length)
      arr_big = arr1
      arr_small = arr2
    else
      arr_big = arr1.length > arr2.length ? arr1 : arr2 
      arr_small = arr1.length > arr2.length ? arr2 : arr1 
    end
    
    while (ind_big < arr_big.length && ind_small < arr_small.length)
      if(arr_small[ind_small] < arr_big[ind_big])
        arr_big.insert(ind_big, arr_small[ind_small])
        ind_small += 1
      end
      ind_big += 1
    end
    arr_big
  end
  ################################################################

  def self.group_anagrams(arr)
    # Note: Anagram is a word, phrase, or name formed by rearranging the letters of another, such as cinema, formed from iceman.

    # Optimized Solution
    # Data Structure: Hash Table
    # Time Complexity: O(nlogn)
    # Space Complexity: O(n)
    result = Hash.new {|h,k| h[k] = []}
    for i in 0..arr.length-1
      key = arr[i].split(//).sort.join # O(nlogn)
      result[key] << arr[i]  # O(n)
    end
    result
  end
  ################################################################

  def self.sum_two_elements_equal_to_target(arr, target)
    # Time Complexity: O(logn)
    # Space Complexity: O(1)
    # Data Structure: Array
    arr = arr.sort
    low = 0
    high = arr.length-1
    while(low < high)
      if( arr[low] + arr[high] > target)
        high -= 1 
      elsif(arr[low] + arr[high] < target)
        low += 1
      else
        return [low, high]
      end
    end
    nil
  end
  ################################################################


  def self.sum_three_elements_equal_to_target(arr, target)
    # Time Complexity: O(n^2)
    # Data Structure: Array
    arr = arr.sort 
    low = 0
    high = arr.length-1
    while(low < high)
      for i in low+1..high-1
        if(arr[low] + arr[i] + arr[high] == target)
          return [low, i, high]
        end
        mid = i
      end
      if(arr[low] + arr[mid] + arr[high] > target)
        high -= 1
      elsif(arr[low] + arr[mid] + arr[high] < target)
        low += 1
      end
    end
    nil
  end
end

# p SortAlgorithm.group_anagrams(['cat', 'first', 'tac', 'cinema', 'act', 'iceman', 'last'])
p SortAlgorithm.sum_two_elements_equal_to_target([1,2,3,5], 6)

