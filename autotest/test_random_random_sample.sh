. $(find .. -name assert.sh -print)

assert ! -z "$(numpy random.random_sample)"
assert ! -z "$(numpy random.random_sample size=1,2)"
