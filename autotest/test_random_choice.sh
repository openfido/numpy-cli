. $(find .. -name assert.sh -print)

assert $(numpy random.choice 1) -eq 0
assert $(numpy random.choice '1,1,1') -eq 1
assert "$(numpy random.choice 1 size=2)" = "0,0"
assert "$(numpy random.choice '1,1,1' size=1,3)" = "1,1,1"
assert $(numpy random.choice 1 replace=True) -eq 0
assert $(numpy random.choice '1,1,1' p='0.8,0.1,0.1') -eq 1
