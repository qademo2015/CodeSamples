###############################################################
# this file contains different implementations for file/folder
# existence check
###############################################################

def create_txt_file(filepath, data)
  File.open(filepath, 'w+') do |file|
    file << data
  end
end

def delete_txt_file(filepath)
  File.delete(filepath) if File.exist?(filepath)
end

def create_folder(dir_name)
  Dir.mkdir(dir_name) unless File.exist?(dir_name)
end

def delete_folder(dir_name)
  Dir.delete(dir_name) if File.exist?(dir_name)
end

# will return true if file exists
def exists?(filepath)
  File.file?(filepath)
end

# will return true if file OR folder exists
def folder_exists?(path)
  File.exist?(path)
end

data = %w[my_email@gmail.com my_first_name my_last_name]
filepath = 'test_file.txt'
dir_name = 'TestDir'

create_txt_file(filepath, data)
puts exists?(filepath)
puts folder_exists?(filepath)
delete_txt_file(filepath)
puts exists?(filepath)
create_folder(dir_name)
puts folder_exists?(dir_name)
delete_folder(dir_name)
puts folder_exists?(dir_name)