require 'byebug'

module MiscAlgorithm 
  def self.number_triangle(n)
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    # Data Structure: String
    triangle = ''
    for i in 1..n
      triangle << "#{i}"
      puts triangle
    end
  end
  ################################################################
  
  def self.longest_palindromic_substring(str)
    # Data structure: String
    # Time complexity: O(n^3)
    # Space complexity: O(1)
    if(str.length > 0)
      largest_palindrome = ''
      i = 0
      while(i < str.length)
        j = str.length-1
        while(j > i)
          starting = i
          ending = j
          while(starting <= ending)
            if(str[starting] != str[ending])
              result = false
              break
            end
            result = true
            starting += 1
            ending -= 1
          end
          if(result == true && str[i..j].length > largest_palindrome.length)
            largest_palindrome = str[i..j]
          end
          j -= 1
        end
        i += 1
      end
      if(largest_palindrome == '')
        largest_palindrome = str[0]
      end
    else
      largest_palindrome = str
    end
    largest_palindrome
  end
  ################################################################
end

=begin

########################################
#7. Compute sum of cubes for given range
def sum_of_cubes(a, b)
  (a..b).inject(0) {|sum, i| sum+= (i**3)} 
end
puts sum_of_cubes(1,3)

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

