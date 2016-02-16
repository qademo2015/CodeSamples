######################################################################
# this file contains function to find second least common element in
# array of integers
######################################################################

# this function uses some standard built-in Ruby methods
def find_second_common(array)
  count_hash = {}
  array.uniq.each{ |elem| count_hash[elem] = array.count(elem) }
  count_hash.select { |key, value| value == count_hash.values.uniq.sort[1] }
end

arr = [5, 5, 4, 5, 4, 6, 6, 6, 1, 3, 3, 4, 4, 5, 4]
puts find_second_common(arr)

arr = [5, 5, 4, 5, 4, 6, 6, 6, 1, 3, 3, 4, 4, 5, 4, 8, 8]
puts find_second_common(arr)

arr = [5, 5, 4, 5, 4, 6, 6, 6, 1, 3, 3, 4, 4, 5, 4, 8, 8, 0]
puts find_second_common(arr)