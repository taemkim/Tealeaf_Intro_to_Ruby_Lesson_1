old_array = [1, 3, 4, 8]
new_array = []

old_array.each do |num|
	new_array << num + 2
end

p old_array
p new_array
