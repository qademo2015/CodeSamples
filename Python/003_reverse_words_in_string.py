######################################################################
# this file contains different implementations of reverse words
# in string without reversing their order
######################################################################


# this method does not change original string
def reverse_words_1(string):
    init_arr = string.split()
    final_arr = []
    for x in init_arr:
        final_arr.append(x[::-1])
    return ' '.join(final_arr)


# this method does not change original string
def reverse_words_2(string):
    arr = string.split()
    for index, item in enumerate(arr):
        arr[index] = item[::-1]
    return ' '.join(arr)


def main():
    string = 'Please reverse all words in this string'
    print(string)
    print(reverse_words_1(string))
    print(reverse_words_2(string))

if __name__ == '__main__':
    main()
