######################################################################
# this file contains different implementations of finding index of
# first sub-string occurrence within given string and returning -1
# in case if nothing found
######################################################################


# this function uses built-in 'find' method
def get_index_1(string, substring):
    return string.find(substring)


# this function uses built-in 'index' method
# which raises an exception if nothing found
def get_index_2(string, substring):
    try:
        return string.index(substring)
    except ValueError:
        return -1


# this function does not use built-in methods
def get_index_3(string, substring):
    index = 0
    if substring in string:
        c = substring[0]
        for char in string:
            if char == c:
                if string[index:index+len(substring)] == substring:
                    return index
            index += 1
    return -1


def main():
    string = 'Stringwithmultiplecharacters'
    substring_1 = 'multi'
    substring_2 = 'abc'
    print(get_index_1(string, substring_1))
    print(get_index_1(string, substring_2))
    print(get_index_2(string, substring_1))
    print(get_index_2(string, substring_2))
    print(get_index_3(string, substring_1))
    print(get_index_3(string, substring_2))


if __name__ == '__main__':
    main()