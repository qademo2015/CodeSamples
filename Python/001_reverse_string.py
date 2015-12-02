######################################################################
# this file contains different implementations of reverse string logic
######################################################################


# this method does not change original string
def reverse_string_1(s):
    """
    fastest solution
    """
    return s[::-1]


# this method does not change original string
def reverse_string_2(s):
    result = ''
    for char in s:
        result = char + result
    return result


# this method does not change original string
def reverse_string_3(s):
    """
    slower solution - requires call 'string.join' on 'reversed' function
    """
    return ''.join(reversed(s))


# this method does not change original string
def reverse_string_4(s):
    result = ''
    n = len(s)
    for i in range(n-1,-1,-1):
        result += s[i]
    return result


def main():
    string = 'Hello world!'
    print(string)
    print(reverse_string_1(string))
    print(reverse_string_2(string))
    print(reverse_string_3(string))
    print(reverse_string_4(string))

if __name__ == '__main__':
    main()
