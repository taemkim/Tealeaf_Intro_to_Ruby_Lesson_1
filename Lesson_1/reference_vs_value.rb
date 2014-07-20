array = [1, 2, 2, 3]

def method_1(array)
  array.uniq
end

method_1(array)
puts array

def method_2(array)
  array.uniq!	
end

method_2(array)
puts array