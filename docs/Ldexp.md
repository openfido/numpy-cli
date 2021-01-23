[[//Ldexp]]

~~~
Syntax:

  numpy Ldexp [<function matrix at 0x10222a7a0>, <function matrix at 0x10222a7a0>]

ldexp(x1, x2, /, out=None, *, where=True, casting='same_kind', order='K', dtype=None, subok=True[, signature, extobj])

Returns x1 * 2**x2, element-wise.

The mantissas `x1` and twos exponents `x2` are used to construct
floating point numbers ``x1 * 2**x2``.

Parameters
----------
x1 : array_like
    Array of multipliers.
x2 : array_like, int
    Array of twos exponents.
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
y : ndarray or scalar
    The result of ``x1 * 2**x2``.
    This is a scalar if both `x1` and `x2` are scalars.

See Also
--------
frexp : Return (y1, y2) from ``x = y1 * 2**y2``, inverse to `ldexp`.

Notes
-----
Complex dtypes are not supported, they will raise a TypeError.

`ldexp` is useful as the inverse of `frexp`, if used by itself it is
more clear to simply use the expression ``x1 * 2**x2``.

Examples
--------
>>> np.ldexp(5, np.arange(4))
array([ 5., 10., 20., 40.], dtype=float16)

>>> x = np.arange(6)
>>> np.ldexp(*np.frexp(x))
array([ 0.,  1.,  2.,  3.,  4.,  5.])
~~~