require 'byebug'

module SearchAlgorithm
  
  def self.binary_search(arr, item)
    #Data Structure: Array
    #Time Complexity: O(n)
    #Space Complexity: O(1)
    first = 0
    last = arr.length - 1
    while(first <= last)
      mid = (first + last) / 2
      if(arr[mid] == item)
        return "#{item} found at position #{mid}"
      elsif(item < arr[mid]) 
        last = mid - 1
      elsif(item > arr[i]) 
          first = mid + 1
      else
        return "#{item} not found in this array"
      end
    end
  end 
  ################################################################ => 

end