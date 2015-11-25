######################################################################
# this file contains different implementations of reverse string logic
######################################################################

# this method does not change original string
def reverse_string_1(string)
  result = ''
  string.scan(/./) { |char| result = char << result }
  result
end

# this method does not change original string
def reverse_string_2(string)
  result = ''
  for i in 1..string.length do
    result += string[-1*i]
  end
  result
end

# this method changes original string in place
class String
  def reverse_string_3
    half_length = self.length / 2
    half_length.times { |i| self[i], self[-i-1] = self[-i-1], self[i] }
    self
  end
end

string = 'Hello world!'
puts reverse_string_1(string)
puts reverse_string_2(string)
puts string.reverse_string_3
