[[//Float_Power]]

~~~
Syntax:

  numpy Float_Power [<function matrix at 0x10222a7a0>, <function matrix at 0x10222a7a0>]

float_power(x1, x2, /, out=None, *, where=True, casting='same_kind', order='K', dtype=None, subok=True[, signature, extobj])

First array elements raised to powers from second array, element-wise.

Raise each base in `x1` to the positionally-corresponding power in `x2`.
`x1` and `x2` must be broadcastable to the same shape. This differs from
the power function in that integers, float16, and float32  are promoted to
floats with a minimum precision of float64 so that the result is always
inexact.  The intent is that the function will return a usable result for
negative powers and seldom overflow for positive powers.

.. versionadded:: 1.12.0

Parameters
----------
x1 : array_like
    The bases.
x2 : array_like
    The exponents.
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
    The bases in `x1` raised to the exponents in `x2`.
    This is a scalar if both `x1` and `x2` are scalars.

See Also
--------
power : power function that preserves type

Examples
--------
Cube each element in a list.

>>> x1 = range(6)
>>> x1
[0, 1, 2, 3, 4, 5]
>>> np.float_power(x1, 3)
array([   0.,    1.,    8.,   27.,   64.,  125.])

Raise the bases to different exponents.

>>> x2 = [1.0, 2.0, 3.0, 3.0, 2.0, 1.0]
>>> np.float_power(x1, x2)
array([  0.,   1.,   8.,  27.,  16.,   5.])

The effect of broadcasting.

>>> x2 = np.array([[1, 2, 3, 3, 2, 1], [1, 2, 3, 3, 2, 1]])
>>> x2
array([[1, 2, 3, 3, 2, 1],
       [1, 2, 3, 3, 2, 1]])
>>> np.float_power(x1, x2)
array([[  0.,   1.,   8.,  27.,  16.,   5.],
       [  0.,   1.,   8.,  27.,  16.,   5.]])
~~~