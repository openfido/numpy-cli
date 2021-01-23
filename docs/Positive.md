[[//Positive]]

~~~
Syntax:

  numpy Positive [<function matrix at 0x10222a7a0>]

positive(x, /, out=None, *, where=True, casting='same_kind', order='K', dtype=None, subok=True[, signature, extobj])

Numerical positive, element-wise.

.. versionadded:: 1.13.0

Parameters
----------
x : array_like or scalar
    Input array.

Returns
-------
y : ndarray or scalar
    Returned array or scalar: `y = +x`.
    This is a scalar if `x` is a scalar.

Notes
-----
Equivalent to `x.copy()`, but only defined for types that support
arithmetic.
~~~
