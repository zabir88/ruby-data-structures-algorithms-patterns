require_relative '../algorithms'

RSpec.describe Algorithms do
  describe 'find_duplicated_elements' do
    it 'returns duplicated elements in an array' do
      arr = [1,2,3,1,4,2]
      expect( Algorithms.find_duplicated_elements(arr) ).to eq([1,2])
    end
  end

  describe 'remove_duplicated_elements' do
    it 'removes duplicate elements in an array' do
      arr = [1,2,3,1,4,2]
      expect( Algorithms.remove_duplicated_elements(arr) ).to eq([1,2,3,4])
    end
  end

  describe 'sum_array_elements' do
    it 'returns the sum of all elements in an array' do
      arr = [1,2,3]
      expect( Algorithms.sum_array_elements(arr) ).to eq(6)
    end
  end

  describe 'join_corresponding_string_elements' do
    
    context "with inputs of same length" do
      str1 = 'abc'
      str2 = 'def'
      it 'joins 2 corresponding string elements' do 
        expect( Algorithms.join_corresponding_string_elements(str1, str2) ).to eq ('adbecf')
      end
    end

    context "with inputs of different length" do 
      str1 = 'abc'
      str2 = 'defg'
      it 'joins 2 corresponding string elements and appends the left over elementss' do
        expect( Algorithms.join_corresponding_string_elements(str1, str2) ).to eq ('adbecfg')
      end
    end
    
  end
  
end