######################################################################
# this file contains different implementations of check if given
# string is a palindrome (reads backwards and forwards the same way)
# or not
######################################################################


def is_palindrome_1(string):
    result = True if string == string[::-1] else False
    return result


# this method uses recursion
def is_palindrome_2(string):
    if len(string) == 1 or len(string) == 0:
        return True
    else:
        if string[0] == string[-1]:
            is_palindrome_2(string[1:-2])
        else:
            return False


# this method does not use recursion
def is_palindrome_3(string):
    str_reversed = ''
    count = len(string)
    while count > 0:
        count -= 1
        str_reversed += string[count]
    if string == str_reversed:
        return True
    else:
        return False


def main():
    string = 'sale'
    print(is_palindrome_1(string))
    string = 'racecar'
    print(is_palindrome_1(string))
    string = 'sale'
    print(is_palindrome_2(string))
    string = 'racecar'
    print(is_palindrome_2(string))
    string = 'sale'
    print(is_palindrome_3(string))
    string = 'racecar'
    print(is_palindrome_3(string))


if __name__ == '__main__':
    main()
