"""Command line numpy interface

This module is a CLI for the python numpy matrix class and supporting
linear algebra library. The general syntax is

  shell% numpy FUNCTION [arguments]

where function is a numpy function that takes zero or more positional
and/or keyword arguments.  Position arguments may be provided explicitly
as a string, or implicitly from stdin.  Keyword argument are provided in
the form KEYWORD=VALUE.  

Examples:

1) Generate a matrix of random numbers

  shell% numpy random.normal size=2,1
  [[-0.35433847]; [ 0.66326107]]

2) Transpose a matrix

  shell% numpy transpose '[[ 0.60125537] [-0.45920654]]'
  [[ 0.60125537]; [-0.45920654]]

3) Pipe data from one operation to another

  shell% numpy random.normal size=2 | matrix transpose
  [[ 1.57581807]; [-0.25069095]]

Getting help:

The "help" command provide additional information on available functions
using the syntax:

  shell% numpy help [command]

Note: any matrix can be provided as a URL, e.g.,

  shell% echo "1,2;3,4" > /tmp/A
  shell% numpy transpose file:///tmp/A
  1,3
  2,4
  
"""

# exit codes
E_OK = 0
E_NOARGS = 1
E_FAILED = 2
E_NOTFOUND = 3
E_INVALID = 4

import sys, os, subprocess, csv, urllib.request
cmdname = os.path.basename(sys.argv[0])
try:
	import numpy
except:
	try:
		subprocess.check_call([sys.executable, "-m", "pip", "install", "--user", "-q","numpy"],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
		import numpy
	except Exception as err:
		print(f"ERROR [{cmdname}]: unable to install numpy automatically ({err}), manual installation required",file=sys.stderr)
		exit(E_FAILED)
import numpy.matlib as matlib
import numpy.linalg as linalg

#
# Argument types
#
def matrix(a):
	"""Matrix or input file"""
	try: # normally it's a string that can be read as a matrix
		return numpy.matrix(a)
	except: # maybe it's a file
		with urllib.request.urlopen(a) as req:
			return numpy.matrix(req.read().decode("utf-8"))

def dimensions(s):
	"""Parse dimensions as N[xM[x[...]]]"""
	return list(map(lambda n:int(n),s.split(',')))

def intlist_args(*s):
	"""Parse arguments as integer list"""
	return list(map(lambda n:int(n),*s))

def arrayorint(a):
	try:
		return int(a)
	except:
		pass
	return numpy.array(numpy.matrix(a).flatten())[0]

def array(a):
	return numpy.array(numpy.matrix(a).flatten())[0]

def order(a):
	if a in ["inf","-inf"]:
		return float(a)
	try:
		return int(a)
	except:
		return a

#
# Arguments and options
#
_REQARGS="" # keyword for required arguments
_VARARGS = [intlist_args] # variable argument list handlers
functions = {
	"eye" :
	{
		_REQARGS : [int],
		"M" : int,
		"k" : int,
		"dtype" : str,
		"order" : str,
	},
	"identity" :
	{
		_REQARGS : [int],
		"dtype" : str,
	},
	"ones" : 
	{
		_REQARGS : [dimensions],
		"dtype" : str,
		"order" : str,
	},
	"dot" :
	{
		_REQARGS : [matrix,matrix],
	},
	"savetxt" : 
	{
		_REQARGS : [str, matrix],
		"fmt" : str,
		"delimiter" : str,
		"newline" : str,
		"header" : str,
		"footer" : str,
		"comments" : str,
		"encoding" : str,
	},
	"trace" :
	{
		_REQARGS : [matrix],
		"offset" : int,
		"axis" : int,
		"dtype" : str,
	},
	"transpose" : 
	{
		_REQARGS : [matrix],
	},
	"zeros" :
	{
		_REQARGS : [dimensions],
		"dtype" : str,
		"order" : str,
	},

	# linag
	"linalg.cholesky" :
	{
		_REQARGS : [matrix],
	},
	"linalg.cond" :
	{
		_REQARGS : [matrix],
		"p" : order,
	},
	"linalg.det" :
	{
		_REQARGS : [matrix],
	},
	"linalg.eig" :
	{
		_REQARGS : [matrix],
	},
	"linalg.eigh" :
	{
		_REQARGS : [matrix],
		"UPLO" : str,
	},
	"linalg.eigvals" :
	{
		_REQARGS : [matrix],
	},
	"linalg.eigvalsh" :
	{
		_REQARGS : [matrix],
		"UPLO" : str,
	},
	"linalg.inv" :
	{
		_REQARGS : [matrix],
	},
	"linalg.lstsq" : 
	{
		_REQARGS : [matrix,matrix],
		"rcond" : float,
	},
	"linalg.matrix_rank" :
	{
		_REQARGS : [matrix],
	},
	"linalg.norm" :
	{
		_REQARGS : [matrix],
		"ord" : order,
		"axis" : int,
		"keepdims" : bool,
	},
	"linalg.pinv" :
	{
		_REQARGS : [matrix],
	},
	"linalg.qr" :
	{
		_REQARGS : [matrix],
		"mode" : str,
	},
	"linalg.slogdet" :
	{
		_REQARGS : [matrix],
	},
	"linalg.solve" : 
	{
		_REQARGS : [matrix,matrix],
	},
	"linalg.svd" : 
	{
		_REQARGS : [matrix],
		"full_matrices" : bool,
		"compute_uv" : bool,
		"hermitian" : bool,
	},

	# matlib
	"matlib.rand" :
	{
		_REQARGS : intlist_args,
	},
	"matlib.randn" :
	{
		_REQARGS : intlist_args,
	},
	"matlib.repmat" : 
	{
		_REQARGS : [matrix, int, int],
	},

	# random
	"random.normal" : 
	{
		_REQARGS : [],
		"loc" : matrix, 
		"scale" : matrix,
		"size" : dimensions,
	},
	"random.rand" : 
	{
		_REQARGS : intlist_args
	},
	"random.randn" : 
	{
		_REQARGS : intlist_args
	},
	"random.randint" : 
	{
		_REQARGS : [int],
		"high" : int,
		"size" : dimensions,
		"dtype" : str,
	},
	"random.random_sample" : 
	{
		_REQARGS : [],
		"size" : dimensions,
	},
	"random.random" : 
	{
		_REQARGS : [],
		"size" : dimensions,
	},
	"random.ranf" :
	{
		_REQARGS : [],
		"size" : dimensions,
	},
	"random.sample" :
	{
		_REQARGS : [],
		"size" : dimensions,
	},
	"random.choice" :
	{
		_REQARGS : [arrayorint],
		"size" : dimensions,
		"replace" : bool,
		"p" : array,	
	},

}

#
# Configuration values
#
class config:
	warning = True
	quiet = False
	debug = False
	exception = False
	newline = '\n'
	format = "%.8g"

numpy.set_printoptions(threshold=sys.maxsize)

#
# Output routines
#
def output(result):
	if type(result) == type(None):
		return
	if type(result) == tuple:
		for item in result:
			output(item)
	elif type(result) == list:
		numpy.savetxt(sys.stdout,result,fmt=config.format,delimiter=",",newline=config.newline)
	elif type(result) == str:
		print(result,file=sys.stdout)
	else:
		try:
			output(numpy.matrix(result).tolist())
		except:
			print(f"output({type(result)}={result}) failed",file=sys.stderr)

def warning(msg):
	if config.warning:
		print(f"WARNING [{cmdname}]: {msg}",file=sys.stderr)

def error(msg,code=None):
	if not config.quiet:
		print(f"ERROR [{cmdname}]: {msg}",file=sys.stderr)
	if config.exception:
		raise Exception(msg)
	elif code != None:
		exit(code)
	
def debug(msg):
	if config.debug:
		print(f"DEBUG [{cmdname}]: {msg}",file=sys.stderr)

#
# Main function
#
def main(argv):
	done = False
	while not done and len(argv) > 1:
		if argv[1] in ["-w","--warning"]:
			config.warning = not config.warning
			del argv[1]
		elif argv[1] in ["-q","--quiet"]:
			config.quiet = not config.quiet
			del argv[1]
		elif argv[1] in ["-d","--debug"]:
			config.debug = not config.debug
			del argv[1]
		elif argv[1] in ["-e","--exception"]:
			config.exception = not config.exception
			del argv[1]
		elif argv[1] in ["-f","--flatten"]:
			config.newline = ';'
			del argv[1]
		elif argv[1] in ["-h","--help"]:
			argv[1] = "help"
		elif argv[1] in ["-v","--version"]:
			argv[1] = "version"
		elif argv[1][0] == '-':
			error(f"option '{argv[1]}' is not valid",code=E_INVALID)
		else:
			done = True

	if len(sys.argv) < 2:
		error(f"Syntax: {cmdname} [options] [command [arguments]]",code=E_NOARGS)
	elif len(sys.argv) == 2 and sys.argv[1] == "help":
		print(f"Syntax: {cmdname} [options] [command] [arguments]",file=sys.stdout)
		print("Options:",file=sys.stdout)
		print("  -d|--debug       enable debugging output",file=sys.stdout)
		print("  -e|--exception   raise exceptions on errors",file=sys.stdout)
		print("  -f|--flatten     use semicolon as newline",file=sys.stdout)
		print("  -h|--help        print this help info",file=sys.stdout)
		print("  -q|--quiet       suppress all output to stderr",file=sys.stdout)
		print("  -w|--warning     suppress warning output",file=sys.stdout)
		print("Commands:",file=sys.stdout)
		print("  help [command]",file=sys.stdout)
		for name in sorted(list(functions.keys())):
			specs = functions[name]
			args = []
			for tag, value in specs.items():
				if not tag:
					if type(value) is list:
						for item in value:
							args.append(f"<{item.__name__}>")
					else:
						args.append(f"<{value.__name__}>")
				else:
					args.append(f"{tag}=<{value.__name__}>")
			print(" ",name," ".join(args),file=sys.stdout)
		exit(E_OK)
	elif len(argv) == 3 and argv[1] == "help":
		name = argv[2]
		if not name in functions.keys():
			error(f"'{argv[2]}' not found",code=E_NOTFOUND)
		sys.stderr = sys.stdout
		package = name.split('.')
		lib = numpy
		for name in package[0:-1]:
			lib = getattr(lib,name)
		call = getattr(lib,package[-1])
		specs = functions[argv[2]]
		args = []
		for tag, value in specs.items():
			if not tag:
				if type(value) is list:
					for item in value:
						args.append(f"<{item.__name__}>")
				else:
					args.append(f"<{value.__name__}>")
			else:
				args.append(f"{tag}=<{value.__name__}>")
		print("numpy",argv[2]," ".join(args),file=sys.stdout)
		output(call.__doc__)
		# help(f"numpy.{argv[2]}")
		exit(E_OK)
	elif len(argv) == 2 and argv[1] == "version":
		print(numpy.__version__,file=sys.stdout)
		exit(E_OK)

	try:
		package = argv[1].split('.')
		lib = numpy
		for name in package[0:-1]:
			lib = getattr(lib,name)
		call = getattr(lib,package[-1])
	except:
		if config.exception:
			raise
		error(f"'{argv[1]}' not found",code=E_NOTFOUND)

	try:
		args = []
		kwargs = {}
		pos = 0
		name = argv[1]
		function = functions[name]
		if function[_REQARGS] in _VARARGS:
			atype = function[_REQARGS]
			if len(argv) > 2:
				args = atype(argv[2:])
		else:
			for arg in argv[2:]:
				spec = arg.split("=")
				if len(spec) < 2:
					if pos >= len(function[_REQARGS]):
						error("too many positional argument",E_INVALID)
					atype = function[_REQARGS][pos]
					args.append(atype(arg))
					pos += 1
				else:
					atype = function[spec[0]]
					kwargs[spec[0]] = atype(spec[1])
			while len(args) < len(function[_REQARGS]):
				if sys.stdin.isatty():
					error("missing positional argument",E_INVALID)
				atype = function[_REQARGS][pos]
				data = sys.stdin.readlines()
				args.append(atype(";".join(data)))
				pos += 1
		if args and kwargs:
			result = call(*args,**kwargs)
		elif args:
			result = call(*args)
		elif kwargs:
			result = call(**kwargs)
		else:
			result = call()
		output(result)
	except Exception as info:
		if config.exception:
			raise
		error(f"'{' '.join(argv[1:])}' failed - {info}",E_FAILED)

	exit(E_OK)

if __name__ == '__main__':
	main(sys.argv)
