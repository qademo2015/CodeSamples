######################################################################
# this file contains basic implementation of verification if given
# number is a prime (true) or not prime (false).
# Number can only be positive integer > 1 (Note: 1 is not a prime)
######################################################################

def is_prime(n)
  result = true
  for i in 3...n
    if (n % i) == 0
      result = false
    end
  end
  result
end

puts is_prime(2)
puts is_prime(9)
puts is_prime(13)
puts is_prime(23)