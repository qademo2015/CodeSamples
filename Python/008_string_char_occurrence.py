######################################################################
# this file contains different implementations of counting how many
# times character appears in string
######################################################################


# this method uses built-in 'count' function
def char_counter_1(string, char):
    return string.count(char)


def char_counter_2(string, char):
    counter = 0
    for key in string:
        if key == char:
            counter += 1
    return counter


def main():
    string = 'I have a string with multiple characters'
    char = 'a'
    print(char_counter_1(string, char))
    print(char_counter_2(string, char))

if __name__ == '__main__':
    main()