[[//Frexp]]
Syntax:

  numpy Frexp [<function matrix at 0x100b237a0>]

frexp(x[, out1, out2], / [, out=(None, None)], *, where=True, casting='same_kind', order='K', dtype=None, subok=True[, signature, extobj])

Decompose the elements of x into mantissa and twos exponent.

Returns (`mantissa`, `exponent`), where `x = mantissa * 2**exponent``.
The mantissa is lies in the open interval(-1, 1), while the twos
exponent is a signed integer.

Parameters
----------
x : array_like
    Array of numbers to be decomposed.
out1 : ndarray, optional
    Output array for the mantissa. Must have the same shape as `x`.
out2 : ndarray, optional
    Output array for the exponent. Must have the same shape as `x`.
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
mantissa : ndarray
    Floating values between -1 and 1.
    This is a scalar if `x` is a scalar.
exponent : ndarray
    Integer exponents of 2.
    This is a scalar if `x` is a scalar.

See Also
--------
ldexp : Compute ``y = x1 * 2**x2``, the inverse of `frexp`.

Notes
-----
Complex dtypes are not supported, they will raise a TypeError.

Examples
--------
>>> x = np.arange(9)
>>> y1, y2 = np.frexp(x)
>>> y1
array([ 0.   ,  0.5  ,  0.5  ,  0.75 ,  0.5  ,  0.625,  0.75 ,  0.875,
        0.5  ])
>>> y2
array([0, 1, 2, 2, 3, 3, 3, 3, 4])
>>> y1 * 2**y2
array([ 0.,  1.,  2.,  3.,  4.,  5.,  6.,  7.,  8.])