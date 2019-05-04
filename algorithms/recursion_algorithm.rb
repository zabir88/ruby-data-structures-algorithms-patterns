require 'byebug'

module RecursionAlgorithm
  def self.fibonacci_recursive(n)
    if(n == 0)
      return 0
    elsif(n == 1)
      return 1
    else
      fibonacci_recursive(n-1) + fibonacci_recursive(n-2)
    end
  end
  ################################################################

  def self.factorial_recursive(n)
    if(n <= 1)
      return n
    end
    n * factorial_recursive(n - 1)
  end
  ################################################################

  def self.palindrome_recursive(str)
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    # Data Structure: String
    if(str.length == 1)
      return true
    else
      return false if str.slice!(0, 1) != str.slice!(-1, 1)
      palindrome_recursive(arr)
    end
  end
  ################################################################
  
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
  ################################################################
  
  def self.rock_judger(rock)
    if rock.length <= 2
      a,b = rock[0], rock[-1] 
      return a>b ? a : b
    else
      a= rock_judger(rock.slice!(0, rock.length/2))
      b= rock_judger(rock)
    end
  end
  ################################################################

  def self.init_array_upto_n(arr=[], n)
    arr<<n
    return arr if n==0
    init_array_upto_n(arr, n-1)
  end
  
  ################################################################

  def self.flatten(array, result = [])
    array.each do |element|
      if element.is_a?(Array)
        flatten(element, result)
      else
        result << element
      end
    end 
    result
  end
  ################################################################

  def shuffle(num, result = [])
    if (result.uniq.length == 6)
      return result.uniq.sort
    else
      arr_num = num.to_s.split(//)
      result << arr_num.shuffle.join.to_i 
      shuffle(num,result)
    end
  end

end

p RecursionAlgorithm.fibonacci_recursive(4)




    
=begin
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
=end
