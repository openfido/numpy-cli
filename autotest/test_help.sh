. $(find .. -name assert.sh -print)

assert -z $(numpy help 1>/dev/null)
assert -z $(numpy help random.normal 1>/dev/null) 
