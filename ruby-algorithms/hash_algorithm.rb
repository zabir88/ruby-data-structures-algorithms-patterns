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

  def self.longest_common_subsequence(str_1, str_2)
    #Data structure: HashMap
    #Complexity: O(nlogn)
    result_1, result_2 = Hash.new(0), Hash.new(0)
    #Removing duplicates from both strings
    str_1.each {|i| result_1[i] += 1 }
    str_2.each {|i| result_2[i] += 1 }
    result_1_keys, result_2_keys = result_1.keys, result_2.keys
    #Finding the elements present in both strings
    new_result = Hash.new(0)
    result_1_keys.each{|i| new_result[i] += 1}
    result_2_keys.each{|i| new_result[i] += 1}
    new_result = new_result.select{|key| new_result[key] > 1}.keys.sort.join
    "#{new_result}: #{new_result.length}"
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

  def self.longest_substring(s)
    # Optimized Solution
    # Data Structure: Hash Table
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    store = {}
    i, j = 0, 0
    longest_substring = ''
    while(i < s.length && j < s.length)
      if(store.has_key?(s[j]) != true)
        store[s[j]] = j
        j += 1
        longest_substring = s[i..j]
      else
        store.delete(s[i])
        i += 1
      end
    end
    longest_substring
  end
  ################################################################
end

p HashAlgorithm.longest_substring("abcab")
