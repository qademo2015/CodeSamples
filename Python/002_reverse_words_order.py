######################################################################
# this file contains different implementations of reverse order of
# words in string
######################################################################


# this method does not change original string
def reverse_order_1(string):
    result = ''
    words = string.split()
    for word in reversed(words):
        if words.index(word) > 0:
            result = result + word + ' '
        else:
            result = result + word
    return result


# this method does not change original string
def reverse_order_2(string):
    result = ' '.join(reversed(string.split()))
    return result


def main():
    string = 'Please reverse order of words'
    print(string)
    print(reverse_order_1(string))
    print(reverse_order_2(string))

if __name__ == '__main__':
    main()
