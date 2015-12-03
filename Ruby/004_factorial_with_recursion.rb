######################################################################
# this file contains different implementations of computing
# factorial of non-negative integer using recursion
######################################################################


# compute the factorial of a non-negative integer without using recursion
def fact_1(n)
  result, i = 1, 1
  while i <= n
    result = result * i
    i += 1
  end
  result
end


# compute the factorial of a non-negative integer using recursion
def fact_2(n)
  if n == 0
    result = 1
  else
    result = n * fact_2(n-1)
  end
  result
end


value = 5
puts fact_1(value)
puts fact_2(value)
