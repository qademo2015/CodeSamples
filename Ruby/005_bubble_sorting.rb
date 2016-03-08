######################################################################
# this file contains different implementations of sorting an array
# of integers by 'bubble' method
######################################################################


# sorting array by 'bubble' method in ascending order
def bubble_sort_1(nums)
  return nums if nums.length <= 1

  for i in 0..(nums.length - 1)
    min, index = nums[i], i
    for j in (i + 1)..(nums.length - 1)
      if nums[j] < min
        min, index = nums[j], j
      end
    end
    if i != index
      nums[i], nums[index] = nums[index], nums[i]
    end
  end

  nums
end

# sorting array by 'bubble' method in ascending order
def bubble_sort_2(nums)
  return nums if nums.length <= 1

  (nums.length-1).times do
    for i in 0..(nums.length - 2)
      if nums[i] > nums[i+1]
        nums[i], nums[i+1] = nums[i+1], nums[i]
      end
    end
  end

  nums
end


nums = [10, 2, 3, 1, 7, 6, 8, 4, 5, 9]
print bubble_sort_1(nums)
puts ''
print bubble_sort_2(nums)
puts ''
