[[//Arccosh]]

~~~
Syntax:

  numpy Arccosh [<function matrix at 0x10222a7a0>]

arccosh(x, /, out=None, *, where=True, casting='same_kind', order='K', dtype=None, subok=True[, signature, extobj])

Inverse hyperbolic cosine, element-wise.

Parameters
----------
x : array_like
    Input array.
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
arccosh : ndarray
    Array of the same shape as `x`.
    This is a scalar if `x` is a scalar.

See Also
--------

cosh, arcsinh, sinh, arctanh, tanh

Notes
-----
`arccosh` is a multivalued function: for each `x` there are infinitely
many numbers `z` such that `cosh(z) = x`. The convention is to return the
`z` whose imaginary part lies in `[-pi, pi]` and the real part in
``[0, inf]``.

For real-valued input data types, `arccosh` always returns real output.
For each value that cannot be expressed as a real number or infinity, it
yields ``nan`` and sets the `invalid` floating point error flag.

For complex-valued input, `arccosh` is a complex analytical function that
has a branch cut `[-inf, 1]` and is continuous from above on it.

References
----------
.. [1] M. Abramowitz and I.A. Stegun, "Handbook of Mathematical Functions",
       10th printing, 1964, pp. 86. http://www.math.sfu.ca/~cbm/aands/
.. [2] Wikipedia, "Inverse hyperbolic function",
       https://en.wikipedia.org/wiki/Arccosh

Examples
--------
>>> np.arccosh([np.e, 10.0])
array([ 1.65745445,  2.99322285])
>>> np.arccosh(1)
0.0
~~~