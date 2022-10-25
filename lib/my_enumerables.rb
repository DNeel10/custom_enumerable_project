module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    my_each do |el| 
      yield(el, index) 
      index += 1
    end
  end

  def my_select
    matched_elements = []
    my_each do |el|
      matched_elements << el if yield(el)
    end
    matched_elements
  end

  def my_all?
    matched_elements = []
    my_each do |el|
      matched_elements << el if yield(el)
    end
    matched_elements == self
  end

  def my_any?
    matched_elements = []
    my_each do |el|
      matched_elements << el if yield(el)
    end
    matched_elements.length.positive?
  end

  def my_none?
    matched_elements = []
    my_each do |el|
      matched_elements << el if yield(el)
    end
    matched_elements.length == 0
  end

  def my_count
    matched_elements = []
    if block_given?
      my_each do |el|
        matched_elements << el if yield(el)
      end
    else
      my_each do |el|
        matched_elements << el
      end
    end    
    matched_elements.length
  end

  def my_map
    mapped_items = []
    my_each do |el|
      mapped_items << yield(el)
    end
    mapped_items
  end

  def my_inject(initial)
    my_each do |el|
      initial = yield(initial, el)
    end
    initial
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here

  def my_each 

    return to_enum(:my_each) unless block_given?

    i = 0
    if block_given?
      while i < length do
        yield(self[i])
        i += 1
      end
    end
    self
  end

end
