[[//Divide]]
Syntax:

  numpy Divide [<function matrix at 0x100b237a0>, <function matrix at 0x100b237a0>]

true_divide(x1, x2, /, out=None, *, where=True, casting='same_kind', order='K', dtype=None, subok=True[, signature, extobj])

Returns a true division of the inputs, element-wise.

Instead of the Python traditional 'floor division', this returns a true
division.  True division adjusts the output type to present the best
answer, regardless of input types.

Parameters
----------
x1 : array_like
    Dividend array.
x2 : array_like
    Divisor array.
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
out : ndarray or scalar
    This is a scalar if both `x1` and `x2` are scalars.

Notes
-----
In Python, ``//`` is the floor division operator and ``/`` the
true division operator.  The ``true_divide(x1, x2)`` function is
equivalent to true division in Python.

Examples
--------
>>> x = np.arange(5)
>>> np.true_divide(x, 4)
array([ 0.  ,  0.25,  0.5 ,  0.75,  1.  ])

>>> x/4
array([ 0.  ,  0.25,  0.5 ,  0.75,  1.  ])

>>> x//4
array([0, 0, 0, 0, 1])