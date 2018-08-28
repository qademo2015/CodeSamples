######################################################################
# this file contains basic implementation of binary search - finding
# position (index) of a target value within a sorted array
# (it will return -1 in case if not found)
# http://codereview.stackexchange.com/questions/63065/binary-search-in-ruby
######################################################################

# this method uses recursion
def binary_search_1(array, value, from=0, to=nil)
  array.sort!
  if to == nil
    to = array.length - 1
  end

  index = -1
  mid = (from + to) / 2

  if value < array[mid]
    index = binary_search_1(array, value, from, (mid - 1))
  elsif value > array[mid]
    index = binary_search_1(array, value, (mid + 1), to)
  else
    index = mid
  end
  index
end

# this method uses iteration approach
# with reducing size of array when iterating
# def binary_search_2(array, value, from=0, to=nil)
#   start_time = Time.now
#   array.sort!
#   # puts array
#   # puts ''
#
#   index = -1
#
#   until array.length <= 1 do
#     mid = (from + (array.length - 1)) / 2
#     puts "Mid element index: #{mid}"
#     puts "Mid value: #{array[mid]}"
#     if value < array[mid]
#       # puts array
#       puts 'Cutting left part'
#       array.slice!((mid+1)..(array.length-1))
#       puts array
#       puts ''
#     elsif value > array[mid]
#       puts 'Cutting right part'
#       array.slice!(0..mid)
#       puts array
#       puts ''
#     else
#       index = mid
#       break
#     end
#   end
#   finish_time = Time.now
#   time_spent = finish_time - start_time
#   puts "Time spent: #{time_spent}"
#   index
# end

# this method uses iteration approach
def binary_search_3(array, value, from=0, to=nil)
  array.sort!
  index = -1
  low = 0
  high = array.length - 1
  while low <= high
    mid = (low + high) / 2
    if array[mid] > value
      high = mid - 1
    elsif array[mid] < value
      low = mid + 1
    else
      index = mid
      break
    end
  end
  index
end

# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].shuffle
arr = []
15.times { |x| arr << x+1 }
arr = arr.shuffle
puts binary_search_1(arr, 5)
# puts binary_search_2(arr, 5)
puts binary_search_3(arr, 5)
