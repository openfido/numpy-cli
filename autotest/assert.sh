EXITCODE=0

assert ()
{
	test $*
	if [ $? -ne 0 ]; then
		echo "ERROR: assert '$*' failed" >>/dev/stderr
		EXITCODE=1
	fi
}
trap onexit EXIT
trap onerror ERR
onexit ()
{
	exit $EXITCODE
}
onerror ()
{
	EXITCODE=2
}

set -x
