puts "Enter a string longer than 10 characters"

word = gets.chomp

def caps(word)
  if word.length >= 10
    puts word.capitalize
  else
    puts "The word that you entered is not longer than 10 characters."
  end
end

caps(word)