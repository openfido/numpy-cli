. $(find .. -name assert.sh -print)

assert $(numpy random.randint 1) -eq 0
assert $(numpy random.randint 1 high=2) -eq 1
assert $(numpy random.randint 1 high=2 size=1,2) = "1,1"
assert $(numpy random.randint 1 high=2 size=1,3 dtype=uint8) = "1,1,1"
