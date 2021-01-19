. ${AUTOTEST:-..}/assert.sh

assert $(numpy random.choice 1) -eq 0
assert $(numpy random.choice '1,1,1') -eq 1
assert "$(numpy random.choice 1 size=2)" = "0,0"
assert "$(numpy random.choice '1,1,1' size=1,3)" = "1,1,1"
assert $(numpy random.choice 1 replace=True) -eq 0
assert $(numpy random.choice '1,1,1' p='0.8,0.1,0.1') -eq 1

assert ! -z "$(numpy random.normal)"
assert ! -z "$(numpy random.normal size=1,2)"
assert ! -z "$(numpy random.normal loc=10)"
assert ! -z "$(numpy random.normal scale=10)"
assert ! -z "$(numpy random.normal loc=10 scale=10)"
assert ! -z "$(numpy random.normal loc=10 scale=10 size=1,3)"

assert ! -z "$(numpy random.rand)"
assert ! -z "$(numpy random.rand 1 2)"

assert $(numpy random.randint 1) -eq 0
assert $(numpy random.randint 1 high=2) -eq 1
assert $(numpy random.randint 1 high=2 size=1,2) = "1,1"
assert $(numpy random.randint 1 high=2 size=1,3 dtype=uint8) = "1,1,1"

assert ! -z "$(numpy random.random_sample)"
assert ! -z "$(numpy random.random_sample size=1,2)"
