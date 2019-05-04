require 'byebug'

module DpAlgorithm
  
  def self.longest_palindromic_substring(str)
    # Brute force solution: Iterate through every possible substring and check whether it is a palindrome or not.
    # Data structure: Array
    # Time Complexity: O(n^3)
    # Sapce Complexity: O(1)

    # Optimized Solution: Use dynamic programming
    # Data structure: 2D Array
    # Time Complexity: O(n^2)
    # Space Complexity: O(n^2)

    max_length = 1
    length = str.length
    palindrome =  ''
    table = Array.new(length) {Array.new(length, false)}

    # check for substrings of length k = 1
    for i in 0..str.length - 1
      table[i][i] = true
      palindrome = str[i]
    end

    # check for substrings of length k = 2
    max_length = 2
    for i in 0..str.length - 2
      if(str[i] == str[i + 1])
        table[i][i + 1] = true
        palindrome = str[i..i+1]
      end
    end

    # check forsubstrings of length k > 2
    k = 3 
    while( k <= str.length)
      for i in 0..str.length - k + 1
        j = i + k - 1
        if(str[i] == str[j] && table[i + 1][j - 1] == true)
          table[i][j] = true
          palindrome = str[i..j]
          if (k > max_length)
            max_length = k
          end
        end 
      end
      k += 1
    end 
    palindrome
  end
  ################################################################

  def self.fibonacci_memoization(n, table = {})
    # Optimized Solution: using dynamic programming and recursion
    # Data Structire
    # Time complexity: O(n)
    # Space complexity: O(n)
    # if (table[n] == nil)
    #   if(n <= 1)
    #     table[n] = n
    #   else
    #     table[n] = fibonacci_memoization(n-1, table) + fibonacci_memoization(n-2, table)
    #   end
    # end
    # table[n]

    # Optimized solution: using dynamic programming and iteration
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    second_last = 0
    last = 1
    if(n == 0)
      return second_last
    end
    for i in 2..n
      current = last + second_last
      second_last = last
      last = current
    end
    last 
  end
  ################################################################

  def self.factorial_memoization(n, table = {})    
    # Optimized solution: Using dynamic programing and recursion
    # Time complexity: O(n)
    # Space complexity: O(n)
    if(table[n] == nil)
      if(n <= 1)
        table[n] = n 
      else
        table[n] = n * factorial_memoization(n - 1, table)
      end
    end
    table[n]
  end
  ################################################################

  def self.longest_common_subsequence(str1, str2)
    # Optimized Solution: Using dynamic programming and iteration
    # Data structure : 2D Array
    # Time Complexity: O(mn)
    # Space Complexity: O(mn)

    # Note: Longest common subsequence does not have to be contiguous but it cannot intersect if a line is drawn joining 2 characters in both strings.

    table = Array.new(str1.length) {Array.new(str2.length, 0)}
    max = 0
    for i in 0..str1.length-1
      for j in 0..str2.length-1
        if(str1[i] == str2[j])
          table[i][j] = 1 + table[i - 1][j - 1]
        else
          table[i][j] = [table[i-1][j], table[i][j-1]].max
        end
        if(table[i][j] > max)
          max = table[i][j]
        end
      end
    end
    max
  end
  ################################################################

  def self.longest_common_substring(str1, str2)
    # Optimized solution: Using dynamic programming and iteration.
    # Data structure : 2D Array
    # Time complexity: O(mn)
    # Space complexity: O(mn)

    # Note: Longest common substring has to be contiguous. It cannot skip characters unlike longest common subsequence.
    table = Array.new(str1.length) {Array.new(str2.length, 0)}
    max = 0
    for i in 0..str1.length-1
      for j in 0..str2.length-1
        if(str1[i] == str2[j])
          table[i][j] = 1 + table[i - 1][j - 1]
        end
        if(table[i][j] > max)
          max = table[i][j]
        end
      end
    end
    max
  end
  ################################################################

  def self.max_sum_contiguous_subarray(arr)
    # Optimized Solution: Using Kadane's algorithm
    # Time complexity: O(n)
    # Space complexity: O(1)
    # Data Structure: Array
  
    starting, ending, s, max_so_far, current_sum = 0, 0, 0, 0, 0
    for i in 0..arr.length - 1
      current_sum += arr[i]
      if(current_sum < 0)
        current_sum = 0
        s = i + 1
      end
      if(current_sum > max_so_far)
        max_so_far = current_sum
        starting = s; 
        ending = i; 
      end
    end
    max_so_far
  end
  ################################################################

  def self.subarray_sum_equal_to_target(arr, target)
    # Optimized Solution: Using Kadane's algorithm
    # Time complexity: O(n)
    # Space complexity: O(1)
    # Data Structure: Array
    current_sum = arr[0]
    j = 0
    for i in 1..arr.length
      if (current_sum > target)
        while(current_sum > target && j < i)
          current_sum = current_sum - arr[j]
          j += 1 
        end
      end
      
      if(current_sum == target)
        return "index between #{j} and #{i-1}"
      end 
      
      if(i < arr.length)
        current_sum += arr[i]     
      end
    end
    
    return "not found"
  end
  ################################################################

  def self.max_sum_subsequence_non_adjacent(arr)
    # Optimized Solution
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    inc = arr[0]
    exc = 0 
    for i in 1..arr.length-1
      temp = inc
      inc = [exc + arr[i] , inc].max
      exc = temp
    end
    inc
  end
  ################################################################

  def self.longest_square_subarray_2D_array(matrix)
    # Time complexity: O(mn)
    # Space complexity: O(mn)
    table = Array.new(matrix.length) {Array.new(matrix[0].length, 0) }
    largest_square = 0
    for i in 0..matrix.length-1
      for j in 0..matrix[i].length-1
        if(i == 0 || j == 0)
          table[i][j] = matrix[i][j]
        elsif(matrix[i][j] > 0)
          table[i][j] = 1 + [table[i][j-1], table[i-1][j], table[i-1][j-1]].min
          if(table[i][j] > largest_square)
            largest_square = table[i][j]
          end
        end
      end
    end
    largest_square
  end
  ################################################################

  def self.knapsack_0_1 
  end
  ################################################################

end

p DpAlgorithm.longest_common_substring('abcdeflmn', 'bidefhkax')
