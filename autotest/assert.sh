EXITCODE=0
assert ()
{
	A=`test $*`
	if [ $? -ne 0 ]; then
		echo "ERROR: assert '$*' failed" >>/dev/stderr
		EXITCODE=1
	else
		echo $1
	fi
}
trap onexit EXIT
onexit ()
{
	exit $EXITCODE
}
