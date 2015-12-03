######################################################################
# this file contains different implementations of reverse order of
# words in string
######################################################################

# this method does not change original string
def reverse_order_1(string)
  string = string.to_s
  result = ''
  array = string.split(/\W+/)
  for i in 0..array.length - 1
    delimiter = ''
    if array.length != 1 and i != array.length - 1
      delimiter = ' '
    end
    result.concat(array[array.length - (i+1)] + delimiter)
  end
  result
end

# this method does not change original string, but uses
# built-in 'reverse' method
def reverse_order_2(string)
  string.to_s.split.reverse.join(' ')
end

string = 'Please reverse order of words'
puts reverse_order_1(string)
puts reverse_order_2(string)
