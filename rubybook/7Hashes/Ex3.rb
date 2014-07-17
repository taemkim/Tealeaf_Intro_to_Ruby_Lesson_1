mycar = { brand: 'Ferrari', model_name: 'F458', model_year: 2014}

mycar.each_key { |k| puts k}
mycar.each_value { |v| puts v}
mycar.each { |k, v| puts "My car's #{k} is #{v}."}