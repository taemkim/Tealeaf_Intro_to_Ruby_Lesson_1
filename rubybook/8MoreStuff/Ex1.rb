
def char_check(word)
	if word =~ /lab/
	  puts word
	else
		puts "Does not match."
	end
end

char_check("laboratory")
char_check("experiment")
char_check("Pans Labyrinth")
char_check("elaborate")
char_check("polar bear")