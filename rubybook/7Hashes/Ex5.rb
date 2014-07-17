gift_list = { dad: 'tools', mom: 'flowers', brother: 'videogame', sister: 'teddybear' }

puts "Searching the gift basket... what are you looking for?"

gift_name =  gets.chomp
gift_search = gift_list.has_value?(gift_name)

if gift_search == true
  puts "Found '#{gift_name}'!"
else
  puts "Can't find '#{gift_name}'!"
end

