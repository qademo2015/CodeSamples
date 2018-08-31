###################################################################
# this file contains different implementations for reading/writing
# and appending data from/to *.csv data file
###################################################################

require 'csv'

# this method will write headers and data into *.csv file
# both headers and data are coming from corresponding arrays
def write_csv_with_headers(headers, data_array, filepath)
  CSV.open(filepath, 'w+', write_headers: true, headers: headers) do |csv|
    data_array.each { |row| csv << row }
  end
end

# this method will write just data (w/o headers) into *.csv file
# data is coming from corresponding array
def write_csv_without_headers(data_array, filepath)
  CSV.open(filepath, 'w+') do |csv|
    data_array.each { |row| csv << row }
  end
end

# this method will append the data to the existing *.csv file
def add_to_csv(data_array, filepath)
  CSV.open(filepath, 'a+') do |csv|
    data_array.each { |row| csv << row }
  end
end

# this method will read data from *.csv file and
# put all values into result array
def read_csv(filepath)
  result_arr = []
  CSV.foreach(filepath) do |row|
    result_arr << row
  end
  result_arr
end

filepath = 'data_file.csv'
headers = %w[email password]
data_array = [%w[my_email_1@gmail.com my_password_1],
              %w[my_email_2@gmail.com my_password_2]]
data_array_to_add = [%w[my_email_3@gmail.com my_password_3],
                     %w[my_email_4@gmail.com my_password_4]]
write_csv_with_headers(headers, data_array, filepath)
write_csv_without_headers(data_array, filepath)
add_to_csv(data_array_to_add, filepath)
puts read_csv(filepath)
