fridge_content = ["milk", "juice", "fruits", "eggs"]

fridge_content.each_with_index do | content, index |
  puts "#{index +1}. #{content}"
end