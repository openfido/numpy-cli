. ${AUTOTEST:-..}/assert.sh

assert $(echo "1,2" | numpy transpose | numpy transpose) = "1,2"