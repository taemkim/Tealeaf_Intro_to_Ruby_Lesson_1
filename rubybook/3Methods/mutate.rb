# Example of a method that modifies its argument permanently
# mutate.#!/usr/bin/env ruby -wKU

a = [1, 2, 3]


def mutate(array)
  array.pop
end

p "Before mutate method: #{a}"
puts "Before mutate method: #{a}"
mutate(a)
p "After mutate method: #{a}"
puts "After mutate method: #{a}"

#no_mutate method

def no_mutate(array) 
  array.last
end 

p "Before no_mutate method: #{a}" 
no_mutate(a) 
p "After no_mutate method: #{a}"
