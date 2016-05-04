######################################################################
# this file contains basic implementation of verification if given
# number is a prime (true) or not prime (false).
# Number can only be positive integer > 1 (Note - 1 is not a prime)
######################################################################
import math


def is_prime(n):
    # limit = int(math.sqrt(n))
    result = True
    for i in range(3, n):
        if n % i == 0:
            result = False
    return result


def main():
    print(is_prime(2))
    print(is_prime(9))
    print(is_prime(13))
    print(is_prime(23))


if __name__ == '__main__':
    main()