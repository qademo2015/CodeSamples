######################################################################
# this file contains different implementations of check if given
# string is a palindrome (reads backwards and forwards the same way)
# or not
######################################################################

# this method uses built-in function 'reverse'
def is_palindrome_1?(string)
  string == string.reverse ? true : false
end

# this method does not use built-in function 'reverse'
# and uses recursion
def is_palindrome_2?(string)
  if string.length == 1 || string.length == 0
    true
  else
    if string[0] == string[-1]
      is_palindrome_2?(string[1..-2])
    else
      false
    end
  end
end

# this method does not use built-in function 'reverse'
# and does not use recursion
def is_palindrome_3?(string)
  string.downcase!
  reversed = ''
  count = string.length
  while count > 0
    count -= 1
    reversed += string[count]
  end
  if string == reversed
    true
  else
    false
  end
end


string = 'sale'
puts is_palindrome_1?(string)
string = 'racecar'
puts is_palindrome_1?(string)
string = 'sale'
puts is_palindrome_2?(string)
string = 'racecar'
puts is_palindrome_2?(string)
string = 'sale'
puts is_palindrome_3?(string)
string = 'racecar'
puts is_palindrome_3?(string)
