#!/bin/bash
cd autotest
N=0
M=0
for TEST in test_*.sh; do
	DIR=${TEST%.*}
	rm -rf $DIR
	mkdir $DIR
	cp $TEST $DIR
	echo "Running $TEST... "
	M=$(($M+1))
	if [ "${DIR##*_}" == "err" ]; then
		(cd $DIR; sh -C ./$TEST 1>stdout 2>stderr ) && echo "FAILED: unexpected success" || N=$(($N+1))
	else
		(cd $DIR; sh -C ./$TEST 1>stdout 2>stderr ) && N=$(($N+1)) || cat $DIR/stderr
	fi
done
echo $M tests, $(($M-$N)) failed