require 'byebug'

module HashAlgorithm

  def self.find_duplicated_elements(list)
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    # Data Structure: HashTable 
    duplicates = Hash.new(0)
    list.each {|i| duplicates[i] += 1}
    duplicates.select {|key| key if duplicates[key] > 1}.keys
  end
  ################################################################

  def self.remove_duplicated_elements(list)
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    # Data Structure: HashTable 
    duplicates = Hash.new(0)
    list.each {|i| duplicates[i] += 1}
    duplicates.keys
  end
  ################################################################

  def self.word_frequency_in_sentence(sentence)
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    # Data Structure: HashTable
    list = sentence.split
    words = Hash.new(0)
    list.each{|i| words[i] += 1}
    words  
  end  
  ################################################################
  
  def self.arr_subset?(arr1, arr2)
    hash = Hash.new(0)
    big_arr = arr1.length > arr2.length ? arr1 : arr2
    small_arr = arr1.length < arr2.length ? arr1 : arr2
    big_arr.each{|i| hash[i] += 1}
    for i in 0..small_arr.length-1
      if(hash.has_key?(small_arr[i]) == false)
        return false
      end
    end
    true
  end
  ################################################################
  
  def self.longest_substring(str)
    # Length of longest substring without repitition
    # Optimized Solution
    # Data Structure: Hash Table
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    store = Hash.new
    output = ''
    i, j = 0, 0
    while( j < str.length)
      if(store.has_key?(str[j]) == false)
        store[str[j]] = j
        j += 1
      else
        if str[i..j-1].length > output.length
          output = str[i..j-1]
        end
        store.delete(str[i])
        i += 1
      end
    end
    if str[i..j].length > output.length
      output = str[i..j]
    end
    output
  end
  ################################################################
  
  def self.pair_with_a_given_sum(arr, target)
    # Optimized Solution
    # Time Coplexity: O(n)
    # Space Coplexity: O(n)
    store = {}
    for i in 0..arr.length-1
      if(store.has_key?(target - arr[i]))
        return "#{target - arr[i]} & #{arr[i]}"
      end
      store[arr[i]] = i
    end
    nil
  end
  ################################################################
  
  def self.triplet_with_a_given_sum(arr, target)
    # Optimized Solution
    # Time Coplexity: O(n^2)
    # Space Coplexity: O(n)
    for i in 0..arr.length-2
      store = {}
      for j in i+1..arr.length-1
        if store.has_key?(target - arr[i] - arr[j]) 
          return "#{target - arr[i] - arr[j]}, #{arr[i]}, #{arr[j]}"
        end
        store[arr[j]] = j
      end
    end
    "not found"
  end
  ################################################################
  
  def self.subarray_with_a_given_sum(arr, target)
    # Optimized Solution
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    store = {}
    current_sum = 0
    for i in 0..arr.length-1
      current_sum += arr[i]
      if(current_sum == target)
        return arr[0..i]
      end
      if (store.has_key?(current_sum - target) )
        return arr[store[current_sum - target]+1..i]
      end
      store[current_sum] = i
    end
    
  end
  ################################################################
  
  def self.find_intersection_between_arrays(arr1, arr2)    
    # Brute force solution: Loop through 3 arrays and save the result in a new array
    # Time Complexity: O(n^3)
    # Space Complexity: O(n)
    
    # Optimized Solution
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    arr1 = arr1.uniq
    arr2 = arr2.uniq
    output = Hash.new(0)
    arr1.each {|i| output[i] += 1}
    arr2.each {|i| output[i] += 1}
    output.select{|k| output[k] > 1}.keys
  end
  ################################################################

  def self.giving_away_candies(t)
    # Olivia has an array of candies. She has to give away half to her borther. Luckily she has an even number of candies. She also likes to keep all varities of candies if possible. In other words if she has several candies of 1 type she would like to give away those first. Write a function which demonstrate this situation.
    # Data Structure: Hash Table
    # Time complexity: O(n log n)
    # Space complexity: O(1)
    candies = Hash.new(0)
    t = t.sort_by{|i| t.count(i)}.reverse 
    t.each{|i| candies[i] += 1} 
    total_giveaway = t.length/2
    count_giveaway = 0
    candies.each do |key, value|
      if(count_giveaway < total_giveaway)   
        if(candies[key] > 1)
          if(candies[key] >= total_giveaway)            
            candies[key] = candies[key] - (total_giveaway - count_giveaway)
            count_giveaway += total_giveaway          
          else
            if (count_giveaway == 0)
              count_giveaway += candies[key]
              candies[key] = 0
            else
              last_value = candies[key]
              candies[key] = candies[key] - (total_giveaway - count_giveaway)
              count_giveaway += last_value
            end
          end 
        else
          count_giveaway += 1
          candies[key] -= 1
        end
      else
        break
      end
    end
    candies.select{|key, value| candies[key] > 0}.keys
  end
  ################################################################
end

p HashAlgorithm.subarray_with_a_given_sum([5,4,1,2,6,7], 7)
