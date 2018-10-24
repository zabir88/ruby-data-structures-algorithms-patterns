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

  def self.longest_common_sequence(str_1, str_2)
    #Data structure: HashMap
    #Complexity: O(n)
    str_1, str_2 = str_1.split(//), str_2.split(//)
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
end