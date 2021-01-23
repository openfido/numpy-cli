[[//Gcd]]
Syntax:

  numpy Gcd [<function matrix at 0x100b237a0>, <function matrix at 0x100b237a0>]

gcd(x1, x2, /, out=None, *, where=True, casting='same_kind', order='K', dtype=None, subok=True[, signature, extobj])

Returns the greatest common divisor of ``|x1|`` and ``|x2|``

Parameters
----------
x1, x2 : array_like, int
    Arrays of values.
    If ``x1.shape != x2.shape``, they must be broadcastable to a common
    shape (which becomes the shape of the output).

Returns
-------
y : ndarray or scalar
    The greatest common divisor of the absolute value of the inputs
    This is a scalar if both `x1` and `x2` are scalars.

See Also
--------
lcm : The lowest common multiple

Examples
--------
>>> np.gcd(12, 20)
4
>>> np.gcd.reduce([15, 25, 35])
5
>>> np.gcd(np.arange(6), 20)
array([20,  1,  2,  1,  4,  5])