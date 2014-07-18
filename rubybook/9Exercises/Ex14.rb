contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"] 

contacts = {"Joe Smith" => {}}

inner_hash_range = [:email, :address, :phone]

contacts.each do |person_name, inner_hash|
  inner_hash_range.each do |item|
    inner_hash[item] = contact_data.shift
  end
end

p contacts