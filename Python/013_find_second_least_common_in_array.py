######################################################################
# this file contains function to find second least common element in
# array of integers
######################################################################


# this function uses some standard built-in Python methods
def find_second_common(list_of_int):
    res_dict = {}
    count_dict = {}
    for elem in set(list_of_int):
        count_dict[elem] = list_of_int.count(elem)
    for key in count_dict.keys():
        if count_dict[key] == list(set(count_dict.values()))[1]:
            res_dict[key] = list(set(count_dict.values()))[1]
    return res_dict


def main():
    data_list = [5, 5, 4, 5, 4, 6, 6, 6, 1, 3, 3, 4, 4, 5, 4]
    print(find_second_common(data_list))
    data_list = [5, 5, 4, 5, 4, 6, 6, 6, 1, 3, 3, 4, 4, 5, 4, 8, 8]
    print(find_second_common(data_list))
    data_list = [5, 5, 4, 5, 4, 6, 6, 6, 1, 3, 3, 4, 4, 5, 4, 8, 8, 0]
    print(find_second_common(data_list))


if __name__ == '__main__':
    main()