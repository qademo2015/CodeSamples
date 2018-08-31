#######################################################################
# this file contains different implementations of check if given number
# is a palindrome (e.g. '121') or not w/o converting it to String
#######################################################################

# this method does not use recursion
def palindrome_one?(number)
  result = false
  rev = 0
  r = number
  while r != 0
    i = r % 10
    rev = rev * 10 + i
    r /= 10
  end
  result = true if rev == number
  result
end

puts palindrome_one?(121)
puts palindrome_one?(233)