names = ['bob', 'joe', 'susan', 'margaret']
names[3] = 'jody'
puts names

names = ['bob', 'joe', 'susan', 'margaret']
names[names.index('margaret')] = 'jody'
puts names
# Assuming that you want 'margaret' in the array to be replaced to 'jody', you need to use names[3] = 'jody'.
# If it is not possible to find the number 3, we can use names[names.index('margaret')] = 'jody' instead.