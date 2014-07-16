puts "What is the first number?"
firstnumber = gets.chomp.to_i
puts "What is the second number?"
secondnumber = gets.chomp.to_i

def multiply(firstnumber, secondnumber)
  puts firstnumber * secondnumber
end

multiply(firstnumber, secondnumber)