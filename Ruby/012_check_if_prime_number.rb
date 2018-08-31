######################################################################
# this file contains basic implementation of verification if given
# number is a prime (true) or not prime (false).
# Number can only be positive integer > 1 (Note: 1 is not a prime)
######################################################################

def prime?(n)
  result = true
  (3...n).each do |i|
    result = false if (n % i).zero?
  end
  result
end

puts prime?(2)
puts prime?(9)
puts prime?(13)
puts prime?(23)