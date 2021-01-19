#!/bin/bash
cd autotest
export AUTOTEST=$PWD
PASS=0
TOTAL=0
for TEST in test_*.sh; do
	DIR=${TEST%.*}
	rm -rf $DIR
	mkdir $DIR
	cp $TEST $DIR
	echo "Running $TEST... "
	TOTAL=$(($TOTAL+1))
	if [ "${DIR##*_}" == "err" ]; then
		(cd $DIR; sh -C ./$TEST 1>stdout 2>stderr ) && echo "FAILED: unexpected success" || PASS=$(($PASS+1))
	else
		(cd $DIR; sh -C ./$TEST 1>stdout 2>stderr ) && PASS=$(($PASS+1)) || grep -v '^+' --context=1 $DIR/stderr | head -n 2
	fi
done
echo $TOTAL tests, $(($TOTAL-$PASS)) failed