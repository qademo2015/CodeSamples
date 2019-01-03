####################################################################
# this file contains different implementations of calculating a sum
# of all integers (both positive and negative) in provided String
####################################################################

# e.g. str = "dFD$#23+++12@#T1234;/.,10" should parse numbers ( 23 + 12 + 1234 + 10 )
# and code should return 1279

def get_sum_one(str)
  sum = 0
  str.scan(/(-?\d+)/).each { |item| sum += item[0].to_i }
  sum
end

str = 'dFD$#23+++12@#T1234;/.,10'
puts get_sum_one(str)
str = '10ab-5'
puts get_sum_one(str)
str = '0123.4'
puts get_sum_one(str)