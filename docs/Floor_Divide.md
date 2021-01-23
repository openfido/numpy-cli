[[//Floor_Divide]]
Syntax:

  numpy Floor_Divide [<function matrix at 0x100b237a0>, <function matrix at 0x100b237a0>]

floor_divide(x1, x2, /, out=None, *, where=True, casting='same_kind', order='K', dtype=None, subok=True[, signature, extobj])

Return the largest integer smaller or equal to the division of the inputs.
It is equivalent to the Python ``//`` operator and pairs with the
Python ``%`` (`remainder`), function so that ``a = a % b + b * (a // b)``
up to roundoff.

Parameters
----------
x1 : array_like
    Numerator.
x2 : array_like
    Denominator.
    If ``x1.shape != x2.shape``, they must be broadcastable to a common
    shape (which becomes the shape of the output).
out : ndarray, None, or tuple of ndarray and None, optional
    A location into which the result is stored. If provided, it must have
    a shape that the inputs broadcast to. If not provided or None,
    a freshly-allocated array is returned. A tuple (possible only as a
    keyword argument) must have length equal to the number of outputs.
where : array_like, optional
    This condition is broadcast over the input. At locations where the
    condition is True, the `out` array will be set to the ufunc result.
    Elsewhere, the `out` array will retain its original value.
    Note that if an uninitialized `out` array is created via the default
    ``out=None``, locations within it where the condition is False will
    remain uninitialized.
**kwargs
    For other keyword-only arguments, see the
    :ref:`ufunc docs <ufuncs.kwargs>`.

Returns
-------
y : ndarray
    y = floor(`x1`/`x2`)
    This is a scalar if both `x1` and `x2` are scalars.

See Also
--------
remainder : Remainder complementary to floor_divide.
divmod : Simultaneous floor division and remainder.
divide : Standard division.
floor : Round a number to the nearest integer toward minus infinity.
ceil : Round a number to the nearest integer toward infinity.

Examples
--------
>>> np.floor_divide(7,3)
2
>>> np.floor_divide([1., 2., 3., 4.], 2.5)
array([ 0.,  0.,  1.,  1.])