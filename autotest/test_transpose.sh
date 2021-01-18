. $(find .. -name assert.sh -print)

assert $(echo "1,2" | numpy transpose | numpy transpose) = "1,2"