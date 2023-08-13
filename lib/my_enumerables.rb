module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0

    #Using the method from Array, enumerate each element and add the index to it
    my_each do |element|
      yield(element, index)
    index += 1
    end

    self
  end

  def my_select(&block)
    return nil unless block_given?
    array_select = []
    #Populate the array with the condition given in the block
    my_each do |element|
      array_select << element if block.call(element)
    end
    #And just return the array
    array_select
  end

  def my_all?(&block)
    return nil unless block_given?

    #Check every element for the one that doesnt match the block condition
    my_each do |element|
      return false unless block.call(element)
    end
    #If not found, just return true
    true
  end

  def my_any?(&block)
    return nil unless block_given?

    #Check every element for the one that match the block condition
    my_each do |element|
      return true if block.call(element)
    end
    #If not found, just return false
    false
  end

  def my_none?(&block)
    return nil unless block_given?

    #Check every element for the one that doesnt match the block condition
    my_each do |element|
      return false if block.call(element)
    end
    #If not found, just return true
    true
  end

  def my_count(&block)
    #Returns the size of the enumerable
    return self.size unless block_given?

    count_block = 0

    #Check every element for the one that matches the block and count up
    my_each do |element|
      count_block += 1 if block.call(element)
    end
    
    #Returns the count of the elements that satisfy the block condition
    count_block
  end

  def my_map(&block)
    return nil unless block_given?

    array = []

    #Use the block call to modify every element in the 
    #enumerable and then populate the array
    my_each do |element|
      array << block.call(element)
    end
    #Returns an array with the same size as the enumerable
    array
  end

  def my_inject(value = 0, &block)
    return nil unless block_given?
    total = value

    #Use the block call to modify the total for each enumerable element based on block logic
    my_each do |element|
      total = block.call(total, element)
    end
    
    total
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method

class Array
  # Define my_each here
  def my_each
    #Enumerator pass to the block every element from self [Array]
    for i in 0..self.size-1
      yield(self[i])
    end
    #Method must return self
    self
  end
end

  
  #array = [1,2,11,3,25]

  #test = array.my_inject { |sum, value| sum + value}

  #p array.my_count {|value| value > 5}
