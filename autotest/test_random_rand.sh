. $(find .. -name assert.sh -print)

assert ! -z "$(numpy random.rand)"
assert ! -z "$(numpy random.rand 1 2)"
