puts "Enter a number between 0 and 100"

number = gets.chomp.to_i

def n0to100(number)
  case
  when number < 0
    puts "This is a negative number"
  when number <= 50
    puts "This number is between 0 and 50"
  when number <= 100
    puts "This number is between 51 and 100." 
  else
    puts "This number is greater than 100."
  end
end

n0to100(number)