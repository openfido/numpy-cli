. $(find .. -name assert.sh -print)

assert ! -z "$(numpy random.normal)"
assert ! -z "$(numpy random.normal size=1,2)"
assert ! -z "$(numpy random.normal loc=10)"
assert ! -z "$(numpy random.normal scale=10)"
assert ! -z "$(numpy random.normal loc=10 scale=10)"
assert ! -z "$(numpy random.normal loc=10 scale=10 size=1,3)"
