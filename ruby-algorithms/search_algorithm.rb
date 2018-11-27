require 'byebug'

module SearchAlgorithm
  
  def self.binary_search(arr, el)
    # Data Structure: Array
    # Time Complexity: O(logn)
    # Space Complexity: O(1)
    first = 0
    last = arr.length - 1
    while(first <= last)
      mid = (first + last) / 2
      if(arr[mid] == el)
        return "#{el} found at position #{mid}"
      elsif(el < arr[mid]) 
        last = mid - 1
      elsif(el > arr[mid]) 
          first = mid + 1
      else
        return "#{el} not found in this array"
      end
    end
    return -1
  end 
  ################################################################ 

  def self.sparse_search(arr, el)
    first = 0
    last = arr.length - 1
    while (first <= last)
      mid = (first + last)/2
      if(arr[mid] == '')
        left = mid - 1
        right = mid + 1
        while(true)
          if(left < first && right > last)
            return -1
          elsif(right <= last && arr[right] != '')
            mid = right
            break
          elsif(left >= first && arr[left] != '')
            mid = left
            break
          end
          right += 1
          left -= 1
        end
      end
      if(el > arr[mid])
        first = mid + 1
      elsif(el < arr[mid])
        last = mid - 1
      elsif(el == ar[mid])
        return "position #{mid}"
      end
    end
  end 
  ################################################################

  def self.rotated_array_search(arr)
  end
  ################################################################

  def self.sorted_matrix_search(arr)
  end
end

p SearchAlgorithm.sparse_search(['at', 'ball', 'car', 'dad', '', ''], 'zabir')
