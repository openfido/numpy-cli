[[//Maximum]]

~~~
Syntax:

  numpy Maximum [<function matrix at 0x10222a7a0>, <function matrix at 0x10222a7a0>]

maximum(x1, x2, /, out=None, *, where=True, casting='same_kind', order='K', dtype=None, subok=True[, signature, extobj])

Element-wise maximum of array elements.

Compare two arrays and returns a new array containing the element-wise
maxima. If one of the elements being compared is a NaN, then that
element is returned. If both elements are NaNs then the first is
returned. The latter distinction is important for complex NaNs, which
are defined as at least one of the real or imaginary parts being a NaN.
The net effect is that NaNs are propagated.

Parameters
----------
x1, x2 : array_like
    The arrays holding the elements to be compared.
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
    The maximum of `x1` and `x2`, element-wise.
    This is a scalar if both `x1` and `x2` are scalars.

See Also
--------
minimum :
    Element-wise minimum of two arrays, propagates NaNs.
fmax :
    Element-wise maximum of two arrays, ignores NaNs.
amax :
    The maximum value of an array along a given axis, propagates NaNs.
nanmax :
    The maximum value of an array along a given axis, ignores NaNs.

fmin, amin, nanmin

Notes
-----
The maximum is equivalent to ``np.where(x1 >= x2, x1, x2)`` when
neither x1 nor x2 are nans, but it is faster and does proper
broadcasting.

Examples
--------
>>> np.maximum([2, 3, 4], [1, 5, 2])
array([2, 5, 4])

>>> np.maximum(np.eye(2), [0.5, 2]) # broadcasting
array([[ 1. ,  2. ],
       [ 0.5,  2. ]])

>>> np.maximum([np.nan, 0, np.nan], [0, np.nan, np.nan])
array([nan, nan, nan])
>>> np.maximum(np.Inf, 1)
inf
~~~