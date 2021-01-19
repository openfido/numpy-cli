. ${AUTOTEST:-..}/assert.sh

assert $(numpy zeros 1,2) = "0,0"
assert $(numpy ones 1,3) = "1,1,1"
assert $(numpy identity 1) = "1"
assert $(numpy matlib.repmat 123 1 3) = "123,123,123"
assert ! -z $(numpy matlib.rand 1)
assert ! -z $(numpy matlib.randn 1)
