######################################################################
# this file contains different implementations of sorting an array
# of integers by 'bubble' method
######################################################################


def bubble_sort_1(nums):
    for i in range(len(nums)):
        cur_min, index = nums[i], i
        for j in range((i+1), len(nums)):
            if nums[j] < cur_min:
                cur_min, index = nums[j], j
        if i != index:
            nums[i], nums[index] = nums[index], nums[i]
    return nums


def main():
    nums = [10, 2, 3, 1, 7, 6, 8, 4, 5, 9]
    print(bubble_sort_1(nums))

if __name__ == '__main__':
    main()
