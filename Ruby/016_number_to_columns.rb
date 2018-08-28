######################################################################
# this file contains different implementations of transition integer
# into columns (similar to Excel)
# (e.g. for 3 it will be 'A', 'B', 'C'; for 28 - 'A', 'B', 'C..Z', 'AA', 'AB')
######################################################################


def number_to_columns(num)
  names = []
  # if num >= 1 && num <= 26
  #   num.times { |index| names << (index+65).chr }
  # end
  # names
  # groups = num / 26
  # remainder = num % 26
  # puts groups
  # puts remainder
  col_name = ''

  while num > 0
    mod = (num - 1) % 26
    col_name = (65 + mod).chr + col_name
    num = (num - mod) / 26
    names << col_name
  end
  names
end

number = 53
puts number_to_columns(number)