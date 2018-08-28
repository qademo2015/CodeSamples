######################################################################
# this file contains different implementations of reverse string logic
######################################################################

# this method does not change original string
def reverse_string_1(string)
  string = string.to_s
  result = ''
  string.scan(/./) { |char| result = char << result }
  result
end

# this method does not change original string
def reverse_string_2(string)
  string = string.to_s
  result = ''
  for i in 1..string.length do
    result += string[-1 * i]
  end
  result
end

# this method does not change original string
def reverse_string_3(string)
  string = string.to_s
  result = ''
  string.length.times { |i| result << string[(i + 1) * -1] }
  result
end

# this method does not change original string
def reverse_string_4(string)
  string = string.to_s
  result = ''
  index = 0
  while index < string.length
    result = string[index] + result
    index += 1
  end
  result
end

# this method does not change original string
def reverse_string_5(string)
  string = string.to_s
  result = ''
  string.split('').each_index do |i|
    result += if i != 0
                string[-1 * (i + 1)]
              else
                string[i - 1]
              end
  end
  result
end

# this method changes original string in place
# by adding new method to String class
class String
  def reverse_string
    (length / 2).times { |i| self[i], self[-i - 1] = self[-i - 1], self[i] }
    self
  end
end


string = 'Hello world!'
puts reverse_string_1(string)
puts reverse_string_2(string)
puts reverse_string_3(string)
puts reverse_string_4(string)
puts reverse_string_5(string)
puts string.reverse_string
