[[//Deg2Rad]]

~~~
Syntax:

  numpy Deg2Rad [<function matrix at 0x10222a7a0>]

deg2rad(x, /, out=None, *, where=True, casting='same_kind', order='K', dtype=None, subok=True[, signature, extobj])

Convert angles from degrees to radians.

Parameters
----------
x : array_like
    Angles in degrees.
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
    The corresponding angle in radians.
    This is a scalar if `x` is a scalar.

See Also
--------
rad2deg : Convert angles from radians to degrees.
unwrap : Remove large jumps in angle by wrapping.

Notes
-----
.. versionadded:: 1.3.0

``deg2rad(x)`` is ``x * pi / 180``.

Examples
--------
>>> np.deg2rad(180)
3.1415926535897931
~~~