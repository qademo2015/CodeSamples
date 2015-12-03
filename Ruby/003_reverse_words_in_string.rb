######################################################################
# this file contains different implementations of reverse words
# in string without reversing their order
######################################################################

# this method does not change original string
def reverse_words_1(string)
  string = string.to_s
  string.split(/\s+/).map{ |word| wl=word.length-1;(0..wl).map{ |i| word[wl-i] }.join }.join(' ')
end


string = 'Please reverse all words in this string'
puts reverse_words_1(string)
