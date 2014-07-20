#1.  create a local variable and modify at an inner scope by
# a) re-assigning the variable to something else
puts "------vs1a------"

a = 3

def method_a
  a = 1
end

puts a

# b) calls a method that doesn't mutate the caller
puts "------vs1b------"

b = [1, 2, 2, 3]

def method_b
  b = b.uniq
end

puts b

# c) call a method that mutates the caller.
puts "------vs1c------"

c = [1, 3, 3, 4]

def method_c
  c = c.uniq!
end

puts c

#2. create a local variable at an inner scope an d try to reference it in the outer scope.
puts "------vs2------"

def method_2
  asdf = 3
end

puts adsf
