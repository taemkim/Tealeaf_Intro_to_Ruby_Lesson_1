# merge! overwrites the original hash's values where as merge doesn't.

h1 = {"a" => 10, "b" => 20, "c" =>30}
h2 = {"a" => 5, "b" => 15}

h1.merge(h2)
puts "before sale prices"
puts h1

h1.merge!(h2)
puts "after sale prices"
puts h1
