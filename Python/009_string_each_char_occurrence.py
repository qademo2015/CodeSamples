######################################################################
# this file contains different implementations of counting how many
# times each unique character appears in string
######################################################################


# simple solution with reducing size of original string
# during execution
def chars_counter_1(string):
    unique_chars_dict = {}
    uniques = ''.join(set(string))
    for char in uniques:
        unique_chars_dict[char] = string.count(char)
        string = string.replace(char, '')
    return unique_chars_dict


def chars_counter_2(string):
    return {char:string.count(char) for char in set(string)}


def main():
    string = 'Stringwithmultiplecharacters'
    print(chars_counter_1(string))
    print(chars_counter_2(string))

if __name__ == '__main__':
    main()