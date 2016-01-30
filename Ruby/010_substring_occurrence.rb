######################################################################
# this file contains different implementations of finding index of
# first sub-string occurrence within given string and returning -1
# in case if nothing found
######################################################################

# this function uses built-in 'index' method
def get_index_1(string, substring)
  string.index(substring) != nil ? string.index(substring) : -1
end

def get_index_2(string, substring)
  index = 0
  if string.include?(substring)
    c = substring[0]
    string.split('').each do |char|
      if char == c
        if string[index, substring.length] == substring
          return index
        end
      end
      index += 1
    end
  end
  -1
end

string = 'Stringwithmultiplecharacters'
substring_1 = 'multi'
substring_2 = 'abc'
puts(get_index_1(string, substring_1))
puts(get_index_1(string, substring_2))
puts(get_index_2(string, substring_1))
puts(get_index_2(string, substring_2))
