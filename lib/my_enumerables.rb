module Enumerable
  # Your code goes here
  def my_all?
    value = true
    for element in self
      unless yield element
        return false
      end
    end
    value
  end

  def my_any?
    value = false
    for element in self
      if yield element
        value = true
      end
    end
    value
  end

  def my_count
    if block_given?
      count = 0
      for element in self
        if yield element
          count+=1
        end
      end
      count
    else
      return self.length
    end
  end

  def my_each_with_index
    if block_given?
      index = 0
      for element in self
        yield element, index
        index+=1
      end
    end
    self
  end

  def my_inject(initial_value)
    sum = initial_value
    for element in self
      sum = yield sum, element
    end
    sum
  end

  def my_map
    map_arr = []
    index = 0
    for element in self
      map_arr[index] = yield element
      index+=1
    end
    map_arr
  end

  def my_none?
    value = true
    for element in self
      if yield element
        value = false
      end
    end
    value
  end

  def my_select
    filtered = []
    for element in self
      if yield element
        filtered.append(element)
      end
    end
    filtered
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for el in self
      yield el
    end
  end
end
