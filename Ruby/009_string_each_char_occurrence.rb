######################################################################
# this file contains different implementations of counting how many
# times each unique character appears in string
######################################################################

def chars_counter_1(string)
  unique_chars_hash = {}
  for char in string.chars.to_a.uniq
    unique_chars_hash[char] = string.count(char)
    string.delete(char)
  end
  unique_chars_hash
end

def chars_counter_2(string)
  unique_chars_hash = {}
  string.chars.to_a.uniq.each { |char|
    unique_chars_hash[char] = string.count(char)
    string.delete(char)
  }
  unique_chars_hash
end

string = 'Stringwithmultiplecharacters'
puts chars_counter_1(string)
puts chars_counter_2(string)
