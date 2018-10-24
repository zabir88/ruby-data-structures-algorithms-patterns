require 'byebug'

module SortAlgorithm
end

=begin
Sort the words in a given sentence by length
def sort_string(string)
  array= string.split
  return array.sort_by{|word| word.length}.join(" ")
end
puts sort_string("Sort words in a sentence")
=end