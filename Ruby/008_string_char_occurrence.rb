######################################################################
# this file contains different implementations of counting how many
# times character appears in string
######################################################################

def char_counter_1(string, char)
  sum = 0
  string.scan(/#{char}/).length
end

def char_counter_2(string, char)
  string.count(char)
end

string = 'I have a string with multiple characters'
char = 'a'
puts char_counter_1(string, char)
puts char_counter_2(string, char)
