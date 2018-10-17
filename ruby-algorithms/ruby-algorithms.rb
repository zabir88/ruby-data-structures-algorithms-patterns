require 'byebug'
require 'benchmark'

module Algorithms
  def self.find_duplicated_elements(arr)
    # Complexity: O(n)
    # Data Structure: HashTable 
    duplicates = Hash.new(0)
    arr.each {|i| duplicates[i] += 1}
    duplicates.select {|key| key if duplicates[key] > 1}.keys
  end

  def self.remove_duplicated_elements(arr)
    # Complexity: O(n)
    # Data Structure: HashTable 
    duplicates = Hash.new(0)
    arr.each {|i| duplicates[i] += 1}
    duplicates.keys
  end

  def self.sum_array_elements(arr)
    # Complexity: O(n)
    # Data Structure: Array 
    arr.inject{|sum, i| sum+=i}
  end

  def self.join_corresponding_string_elements(str1, str2)
    # Complexity: O(n)
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

  def self.word_frequency_in_sentence(sentence)
    # Complexity: O(n)
    # Data Structure: HashTable
    arr = sentence.split
    words = Hash.new(0)
    arr.each{|i| words[i] += 1}
    words  
  end 

  def self.palindrome(sample)
    # Complexity: O(n)
    # Data Structure: Array
    arr = sample.downcase.gsub(' ', '').split(//)
    arr.each_index do |index|
      if arr[index] != arr[-index-1]
        return "#{sample} is not a palindrome"
      end
    end
    "#{sample} is a palindrome"
  end

  def self.palindrome_recursive(sample)
    # Complexity: O(n)
    # Data Structure: Array
    arr = sample.downcase.gsub(' ', '').split(//)
    if(arr.length == 1)
      return true
    else
      return false if arr.shift != arr.pop
      arr = arr.join
      palindrome_recursive(arr)
    end
  end
  
  def self.number_triangle(n)
    # Complexity: O(n)
    # Data Structure: String
    triangle = ''
    for i in 1..n
      triangle << "#{i}"
      puts triangle
    end
  end
  
  def self.number_triangle_recursive(n)
    # Complexity: O(n)
    # Data Structure: String
    if( n == 0 ) 
      return ""
    else
      triangle = number_triangle_recursive(n - 1)
      triangle = triangle + "#{n}"
      puts triangle
      triangle
    end
  end
  
  def self.fibonacci_recursive(n)
    puts "#{n}"
    if(n == 0)
      return 0
    elsif(n == 1)
      return 1
    else
      puts "stack 1 var: #{n}"
      a = fib(n-1)
      puts "stack 1 f: #{a}"

      puts "stack 2 var: #{n}"
      b =  fib(n-2)
      puts "stack 2 f: #{b}"
      a + b
    end
  end
  
  def self.fibonacci_memoization(n)
    fibarr = [0,1,1];
    if (fibarr[n] == nil)
      n1, n2 = n-2, n-1
      a, b = fib(n1), fib(n2)
      fibarr[n] = a + b;
    end
    fibarr[n]
  end

  def self.sort_by_price_ascending(json_string)
    # input: '[{"name":"eggs","price":1},{"name":"coffee","price":9.04},{"name":"banana","price":1}, {"name":"rice","price":4.04}]'
    require 'json'
    input = JSON.parse(json_string)
    input = input.sort_by{|a| [a['price'], a['name']] }
    JSON.generate(input)
  end

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

  def self.merge_sorted_arrays(array1, array2)
    # array1.concat(array2).sort
    result = []
    array1_index = 0 
    array2_index = 0 
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

  def self.reverse_sentence(sentence)
    # sentence.split.reverse.join(' ')
    result = []
    input = sentence.split
    for i in 1..input.length
      result << input[-i]
    end
    result.join(' ')
  end

  def self.find_duplicated_hash_in_arr_provided_key(arr, key)
    duplicates = Hash.new(0)
    arr.each {|i| duplicates[i[key.to_sym]] += 1 }
    duplicates = duplicates.select{|i| duplicates[i] > 1}.keys
    # arr.each do |i|
    # end
  end

  def self.move_zeros_to_front(array)   
  end

  def self.power_sum_recursive(x, n)
  end
end

=begin

#3. Sort the words in a given sentence by length
def sort_string(string)
  array= string.split
  return array.sort_by{|word| word.length}.join(" ")
end
puts sort_string("Sort words in a sentence")
#############################################
#4. Select n random element from an array 
def random_select(array, n)
  array.sample(n)
end
p random_select([1,2,2,3,4], 3)

########################################
#7. Compute sum of cubes for given range
def sum_of_cubes(a, b)
  (a..b).inject(0) {|sum, i| sum+= (i**3)} 
end
puts sum_of_cubes(1,3)
######################################

#9. Check if all elements in an array are Fixnum
def array_of_fixnums?(array)
  array.each do |i|
    if i%1!=0
      return false
    end
  end
  return true
end
puts array_of_fixnums?([4,1,3,4,5])
########################################
#10. Number shuffle
def shuffle(num)
  num = num.to_s.split(//)
  result=[]
  combo= 6
  while (result.uniq.length != combo)
    result << num.shuffle.join.to_i 
  end
  result.uniq
end
p shuffle(123)
###########################################

#12.  Display the last 2 letters of a word
def lastLetter(word)
  if word.length >= 1 && word.length<= 100
    x=word.upcase.split(//)
    return "#{x[-1]}" + " " +"#{x[-2]}" 
  else return false
  end 
end
puts lastLetter('apple')
#########################################

#15. Fizzbuzz
def fizzbuzz(n)
  for i in 1..n
    i%3==0 && i%5==0 ? (p "FizzBuzz") : i%3==0 ? (p "Buzz") : i%5==0 ? (p "Fizz") : (p i)
  end
end
fizzbuzz(20)
#######################################
#16. Largest Prime factor of a number
def primefactor(n)
  require 'prime'
  a= (1..n).select{|i| n % i == 0 && i.prime?}
  a[-1]
end
p primefactor(13195)
#####################################
#18. Sum square difference
a=0
b=0
c=0
for i in 1..100
  a+= i**2
  (b+= i)
  c=b**2
  d= c-a
end
p a, c, d
##################################
#19. 10001st prime
require 'prime'
a=[]
a=Prime.take(10001)
p a[-1]
###################################

#21. Summation of Primes
require 'prime'
puts Prime.each(2000000).inject{|sum, i| sum+i}

####################################

#24. Minimum value in an array through iteration
def minimum_value(arr)
  if arr.length <= 1
    return arr[0]
  else
    min=arr[0]
    arr.map.with_index{|i , j| min=arr[j] if arr[j] <= min }     
  end
  return min
end
p minimum_value([-12,34,2,3,0])
####################################
#25. Capitalization using iteration
def capitalize_words(string)
  string.split.map{|i| [i[0].upcase, i[1..-1]].join}
end
p capitalize_words('foo asdfa kldfm')
####################################
#26. Median of an array
def median(arr)
  arr= arr.sort
  median= (arr[(arr.length-1)/2] + arr[arr.length/2])/2.0
  return median
end
p median([1,2,3,4,5,5,6])
#################################
#27. Pascal's Traingle using iteration
def pascaltraingle(k)
  def factorial(n)
    n==0 ? 1 : n*factorial(n-1)
  end
  for n in 0..k
    p= ""
    for r in 0..n
      r1=n-r
      p << "#{(factorial(n)/ (factorial(r) * factorial(r1)))}"
    end
    puts p
  end
end
pascaltraingle(10)
##############################
#28. String Mingle using recursion
def strmingle(str1, str2) 
  str1=str1.split(//)
  str2= str2.split(//)
  k=0
  for i in 0..(str1.length-1) 
    k+=1
    str1.insert(i+k, str2[i])
  end
  return str1.join
end
puts strmingle('sdf', '234')
#Another method
def strmingle(str1, str2)
  return str1.split(//).zip(str2.split(//)).flatten.join
end
puts strmingle('sdf', '234')
#################################
#29.  Find the "Balance index” in this array, where “balance index” means that the sum of the elements on the left and right of this index is equal. If there is no balance index return -1.
begin_time= Time.now
def match_index(arr)
  match_index= arr[0]
  for i in 1..arr.length-2
    return match_index= arr[i] if arr[0, i].inject{|k, sum| sum+k}==arr[i+1, arr.length].inject{|k, sum| sum+k} 
  end
  return match_index
end 
p match_index([0,7,1,4,3,2,3])
end_time=Time.now
puts "#{(end_time-begin_time)*1000} miliseconds"
###################################

########################## RECURSION EXMPLES ###################################### 
#1. Finding haviest rock/ max number using recursion
def rock_judger(rock)
  if rock.length <= 2
    a,b = rock[0], rock[-1] 
    return a>b ? a : b
  else
    a= rock_judger(rock.slice!(0, rock.length/2))
    b= rock_judger(rock)
  end
end
rocks = 5.times.map{rand(20)+1}
p rocks
p rock_judger(rocks)
##################################
#2. Adding elements upto the input number at the beginning of an array using recursion 
def append(arr=[], n)
  arr<<n
  return arr if n==0
  append(arr, n-1)
end
p append(2)
##################################
#3. Fibonacci number using recursion 
def fib(n)
  return 0 if n==0
  return 1 if n==1
  return fib(n-1) + fib(n-2)   
end
p fib(4)
###################################
#4. Finding factorial of a number using recursion 
def fact(n)
  return 1 if n==1 || n==0
  n*fact(n-1)
end
p fact(3)
#################################
#5. Palindrome using recursion 
def palindrome_recursive(str)
  str=str.downcase.gsub(" ", "")
  return true if str.length==1
  return palindrome_recursive(str) if str.slice!(0)==str.slice!(-1) 
  return false  
end
p palindrome?("racecar")
#####################################
#6. Print "n-1 bottles of water on the wall" using recursion
def waterbottles(n)
  if n==0
    return "no more waterbottles on the wall"
  else
    puts "#{n} waterbottles on the wall"  
    return waterbottles(n-1)
  end
end
p waterbottles(3)       
###################################
#7. Flattening array using recursion 
def flatten(array, result = [])
  array.each do |element|
    if element.is_a?(Array)
      flatten(element, result)
    else
      result << element
    end
  end 
  result
end
p flatten([[1,2], [3,4]])
######################################
#8. Number shuffle problem using recursion
def shuffle(num, result)
  
  if (result.uniq.length==6)
    return result.uniq.sort
  else
    arr_num = num.to_s.split(//)
    result << arr_num.shuffle.join.to_i 
    shuffle(num,result)
  end
end
p shuffle(123, [])
######################################
#9. Double integers using recursion 
def doubler (n)
  puts n  
  if n > 10
    return n
  else
    doubler(n*2)
  end
end
doubler(2)
###################################

################## Hacker Rank + RECURSION #########################
#10. Finding super digit of an integer using recursion. Super digit is the sum of each digit in an integer until it reduces to single digit. 2 inputs the integer and another integer which multiplies the first arguement to make it a bigger integer.
def superdigit(n, k)
  
  if n.is_a? (Integer)
    n=(n.to_s)*k
  end
  
  n= n.split(//).map{|i| i.to_i}.inject(0){|i, sum| sum+i}.to_s
  
  if n.length > 1
    return superdigit(n, k)
  else 
    return n 
  end
end
p superdigit(123, 3)
##################################
#11. GCD with Eucledian Alogrithm using recursion
def GCD(x, y)
  if x > y
    r= x.remainder(y)
    if y%r==0
      return r
    else 
      GCD(y, r)
    end
  else
    r= y.remainder(x)
    if x%r==0
      return r
    else 
      GCD(x, r)
    end
  end   
end
p GCD(1701, 3768)

###########################
#13. Pascal's traingle using recursion
def pascaltraingle(k)
  
  def factorial(n)
    n==0 ? 1 : n*factorial(n-1)
  end
  
  if k ==0 
    return  
  else
    pascaltraingle(k-1)
    arr=""
    for r in 0..k
      r1=k-r
      arr << "#{(factorial(k)/ (factorial(r) * factorial(r1)))}"
    end
    puts arr.center(50)
  end
end
pascaltraingle(4)
################################

def paranthesis_matcher(str)
  split_str=str.split(//)
  if (split_str[0]== "(") && (split_str[-1]== "(") || (split_str[0]==")" && split_str[0]==")") || (split_str[0]==")" && split_str[0]=="(")   
    return false
  else
    if split_str.count("(") == split_str.count(")")
      split_str[1..-2].each do |i|
        if (i[j-1] != i[j+1])
          return true
        else
          return false  
        end 
      end
    else
      return false
    end 
  end
end
puts paranthesis_matcher("((12)))(")
############################################

def digits_to_roman(multiplier)
  return "No zeros" if mulitplier == 0
  symbols = {1000 => "M",900 => "CM", 500 => "D",400 => "CD", 100 => "C",90 => "XC", 50 => "L",40 =>"XL", 10 => "X",9 => "IX", 5 => "gross_result",4 => "IV",  1=> "I"}
   symbol = []
   count = 0
   symbols.each do |num, sym|
     symbol<<(sym * (multiplier/num))
     multiplier = multiplier % num
     count += 1
   end
  symbol.join
end
p roman_numeral(36)
###############################
###Recursive Method
def roman_to_digits(roman, total_result=0)
  # for reference roman_symbols = {1000 => "M",900 => "CM", 500 => "D",400 => "CD", 100 => "C",90 => "XC", 50 => "L",40 =>"XL", 10 => "X",9 => "IX", 5 => "V",4 => "IV",  1=> "I"}  
  r=roman.upcase
  input_valid=r.match(/[^MCDXLIV]/)
  if input_valid.nil? 
    if r.length > 0
      if r[0]==('M')  
        gross_result = 1000; len = 1
      elsif r[0..1]==('CM') 
        gross_result = 900; len = 2
      elsif r[0]==('D')  
        gross_result = 500; len = 1 
      elsif r[0..1]==('CD') 
        gross_result = 400; len = 2
      elsif r[0]==('C')  
        gross_result = 100; len = 1
      elsif r[0..1]==('XC') 
        gross_result = 90; len = 2
      elsif r[0]==('L')  
        gross_result = 50; len = 1
      elsif r[0..1]==('XL') 
        gross_result = 40; len = 2
      elsif r[0]==('X')  
        gross_result = 10; len = 1
      elsif r[0..1]==('IX') 
        gross_result = 9; len = 2
      elsif r[0]==('V')  
        gross_result = 5; len = 1
      elsif r[0..1]==('IV') 
        gross_result = 4; len = 2
      else r[0]==('I')  
        gross_result = 1; len = 1
      end
      total_result+=gross_result  
      r.slice!(0, len)
      roman_to_digits(r, total_result)
    else
      total_result
    end
  else
    "Invalid Input"
  end  
end
p roman_to_digits("MMVIII")
############################
=end

