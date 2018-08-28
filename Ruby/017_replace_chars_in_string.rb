######################################################################
# this file contains different implementations of replacing characters
# in string with other characters N position ahead of original in
# ASCII table - only from range from a..z. All another characters
# should not be replaced
######################################################################

def replace1(str, number)
  result = ''
  str.split('').each do |char|
    code = char.ord
    if code > 96 && code < 123
      new_code = code + number
      if (new_code) < 123
        result += (new_code).chr
      else
        result += (new_code-26).chr
      end
    else
      result += char
    end
  end
  result
end

string = 'A#za, my test string z!'
puts replace1(string, 12)