######################################################################
# this file contains different implementations of computing
# factorial of non-negative integer using recursion
######################################################################


def fact_1(n):
    """
    compute the factorial of a non-negative integer
    without using recursion
    """
    result, i = 1, 1
    while i <= n:
        result = result * i
        i += 1
    return result


def fact_2(n):
    """
    compute the factorial of a non-negative integer
    using recursion (calling function by itself)
    """
    if n == 0:
        result = 1
    else:
        result = n * fact_2(n-1)
    return result


def main():
    value = 5
    print(fact_1(value))
    print(fact_2(value))

if __name__ == '__main__':
    main()
