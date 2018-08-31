###################################################################
# this file contains different implementations for reading/writing
# and appending data from/to *.txt data file
###################################################################

# this method will write data (from array of strings) to *.txt file
def write_txt_file(data_array, filepath)
  File.open(filepath, 'w+') do |file|
    data_array.each do |str|
      file.write(str + "\n")
    end
  end
end

# this method will append data (from array of strings) to
# existing *.txt file (new file will be created otherwise)
def add_to_txt_file(data_array, filepath)
  File.open(filepath, 'a+') do |file|
    data_array.each do |str|
      file.write(str + "\n")
    end
  end
end

# this method will read data from *.txt file and
# put all row data into result array
def read_from_txt(filepath)
  result_arr = []
  File.open(filepath).each do |line|
    result_arr << line
  end
  result_arr
end

filepath = 'data_file.txt'
data_array = %w[first second third]
data_array_to_add = %w[fourth fifth]
write_txt_file(data_array, filepath)
add_to_txt_file(data_array_to_add, filepath)
puts read_from_txt(filepath)
