[[//Exp2]]

~~~
Syntax:

  numpy Exp2 [<function matrix at 0x10222a7a0>]

exp2(x, /, out=None, *, where=True, casting='same_kind', order='K', dtype=None, subok=True[, signature, extobj])

Calculate `2**p` for all `p` in the input array.

Parameters
----------
x : array_like
    Input values.
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
out : ndarray or scalar
    Element-wise 2 to the power `x`.
    This is a scalar if `x` is a scalar.

See Also
--------
power

Notes
-----
.. versionadded:: 1.3.0



Examples
--------
>>> np.exp2([2, 3])
array([ 4.,  8.])
~~~
