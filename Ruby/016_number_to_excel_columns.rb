##############################################################################
# this file contains different implementations of transition integer
# into columns (similar to column titles in Excel)
# (e.g. for 3 it will be 'A', 'B', 'C'; for 28 - 'A', 'B', 'C..Z', 'AA', 'AB')
##############################################################################

def charset
  names = []
  26.times do |i|
    names << (65 + i).chr
  end
  names
end

def number_to_columns(num)
  names = [] # array of Excel-like column names
  chars = charset
  char_index = 0 # set initial index of leading char in column name
  second_char_index = 0 # set initial index of trailing char in column name
  if num >= 1 && num <= (chars.length**2 + chars.length)
    num.times do |index|
      if index <= (chars.length - 1)
        names << chars[index]
      else
        names << chars[char_index] + chars[second_char_index]
        if second_char_index < (chars.length - 1)
          second_char_index += 1
        else
          second_char_index = 0
          char_index += 1
        end
      end
    end
  else
    puts 'Provided number is outside of allowed range (1..702)'
  end
  names
end

number = 702
puts number_to_columns(number)