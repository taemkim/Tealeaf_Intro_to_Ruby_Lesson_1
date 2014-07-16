arr = ["b", "a"]
arr = arr.product(Array (1..3))
arr.first.delete(arr.first.last)

# the program returns 1
# the value of arr is now [["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]] 
# this is because arr.first.last is 1 and arr.first.delete(1) deletes 1 within arr.first, which is ["b", 1].

arr = ["b", "a"]
arr = arr.product([Array (1..3)])
arr.first.delete(arr.first.last)

# the program returns [1, 2, 3]
# the value of arr is now [["b"], ["a", [1, 2, 3]]]
# this is because arr.first.last is [1, 2, 3] and arr.first.delete([1, 2, 3]) deletes [1, 2, 3] from arr.first, which is ["b", [1, 2, 3]].