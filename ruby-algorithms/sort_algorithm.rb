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

  def self.sum_two_elements(arr, target)
    # Time Complexity: O(n logn)
    # Data Structure: Array
    arr = arr.sort
    low = 0
    high = arr.length-1
    while(low < high)
      if( arr[low] + arr[high] > target)
        high -= 1 
        indices = [low, high]
      elsif(arr[low] + arr[high] < target)
        low += 1
        indices = [low, high]
      end

      if(arr[low] + arr[high] == target)
        return indices
      end
    end
    return "Not Found"
  end
  ################################################################


  def self.sum_three_elements(arr, target)
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
    return "Not Found"
  end
end

p SortAlgorithm.sum_three_elements([1,4,5,6,10,11], 26)

