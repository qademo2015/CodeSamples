######################################################################
# this file contains different implementations of calculating maximum
# sum from Top to Bottom of the Triangle
######################################################################
# By starting at the top of the triangle below and
# moving to adjacent numbers on the row below,
# the maximum total from top to bottom is 23
#
# 3
# 7 4
# 2 4 6
# 8 5 9 3
#
# That is: 3 + 7 + 4 + 9 = 23
#
# Write a runnable program that obtains the maximum total
# for any triangle of that type (the faster it runs the better).
#####################################################################

# Providing data input
# triangle - data input which represents multiline String

def max_sum(triangle)
  # creating array from data input
  arr = triangle.each_line.map{ |line| line.split.map(&:to_i) }
  sum = arr.inject([]){ |res, x|
    maxes = [0, *res, 0].each_cons(2).map(&:max)
    x.zip(maxes).map{ |a, b| a+b }
  }.max
end

triangle = '
3
7 4
2 4 6
8 5 9 3'

puts max_sum(triangle)
