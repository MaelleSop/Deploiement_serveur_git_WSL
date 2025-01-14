"""
This is a module to calculate the sequence of the mathematical formula of the
gaussian summation formela. Furthermore there is the possibility to let the
calculation be done by a loop.
"""

def loop(number):
    """
    This function returns the value of the small Gauss.
    (Sums all numbers from 1 to n together, as a loop).

    :param n: only integer
    :return: integer of the sum of gaussian summation formela
    """

    try:
        number = int(number)
    except ValueError:
        raise TypeError('Must be an integer,') from ValueError
    if number < 1:
        raise ValueError('The number must be greater than 0.')

    ergebnis = 0
    for i in range(1, number+1):
        ergebnis = i + ergebnis
    return ergebnis


def formula(number):
    """
    This function returns the value of the small Gauss.
    (Sums all numbers from 1 to n together, according to Gauss formula)

    :param n: only integer
    :return: integer of the sum of gaussian summation formela
    """
    try:
        number = int(number)
    except ValueError:
        raise TypeError("Must be an integer.") from ValueError
    if number < 1:
        raise ValueError('The number must be greater than 0.')

    return int(number*(number+1)/2)
