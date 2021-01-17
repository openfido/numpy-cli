#!/usr/bin/python3
"""General linear algebra for shell scripts

This module is a CLI for the python numpy matrix class and supporting
linear algebra library. The general syntax is

  shell% numpy FUNCTION [arguments]

where function is a numpy function that takes zero or more positional
and/or keyword arguments.  Position arguments may be provided explicitly
as a string, or implicitly from stdin.  Keyword argument are provided in
the form KEYWORD=VALUE.  

Examples:

1) Generate a matrix of random numbers

  shell% numpy random.normal size=2x1
  [[-0.35433847]; [ 0.66326107]]

2) Tranumpyose a matrix

  shell% numpy transpose '[[ 0.60125537] [-0.45920654]]'
  [[ 0.60125537]; [-0.45920654]]

3) Pipe data from one operation to another

  shell% numpy random.normal size=2 | matrix transpose
  [[ 1.57581807]; [-0.25069095]]

Getting help:

The "help" command provide additional information on available functions
using the syntax:

  shell% numpy help [command]

"""

# exit codes
E_OK = 0
E_NOARGS = 1
E_FAILED = 2
E_NOTFOUND = 3
E_INVALID = 4

import sys, os, subprocess, csv
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

def dimensions(s):
	"""Parse dimensions as N[xM[x[...]]]"""
	return list(map(lambda n:int(n),s.split('x')))

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
	numpy.array(numpy.matrix(a).flatten())[0]

functions = {
	"random.normal" : 
	{
		"" : [],
		"loc" : numpy.matrix, 
		"scale" : numpy.matrix,
		"size" : dimensions,
	},
	"random.rand" : 
	{
		"" : intlist_args
	},
	"random.randn" : 
	{
		"" : intlist_args
	},
	"random.randint" : 
	{
		"" : [int],
		"high" : int,
		"size" : dimensions,
		"dtype" : str,
	},
	"random.random_sample" : 
	{
		"" : [],
		"size" : dimensions,
	},
	"random.random" : 
	{
		"" : [],
		"size" : dimensions,
	},
	"random.ranf" :
	{
		"" : [],
		"size" : dimensions,
	},
	"random.sample" :
	{
		"" : [],
		"size" : dimensions,
	},
	"random.choice" :
	{
		"" : [arrayorint],
		"size" : dimensions,
		"replace" : bool,
		"p" : array,	
	},
	"savetxt" : 
	{
		"" : [str, numpy.matrix],
		"fmt" : str,
		"delimiter" : str,
		"newline" : str,
		"header" : str,
		"footer" : str,
		"comments" : str,
		"encoding" : str,
	},
	"transpose" : 
	{
		"" : [numpy.matrix],
	},
}
vararg = [intlist_args] # variable argument list handlers

class config:
	warning = True
	quiet = False
	debug = False
	exception = False
	format = "%.8g"

numpy.set_printoptions(threshold=sys.maxsize)

def output(result):
	if type(result) == type(None):
		return
	if type(result) != list:
		output(numpy.matrix(result).tolist())
	else:
		numpy.savetxt(sys.stdout,result,fmt=config.format,delimiter=",")

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
		else:
			done = True

	if len(sys.argv) < 2:
		error(f"Syntax: {cmdname} [options] [command [arguments]]",code=E_NOARGS)
	elif len(sys.argv) == 2 and sys.argv[1] == "help":
		print(f"Syntax: {cmdname} [options] [command] [arguments]",file=sys.stderr)
		print("Options:",file=sys.stderr)
		print("  -d|--debug       enable debugging output",file=sys.stderr)
		print("  -e|--exception   raise exceptions on errors",file=sys.stderr)
		print("  -q|--quiet       suppress all output to stderr",file=sys.stderr)
		print("  -w|--warning     suppress warning output",file=sys.stderr)
		print("Commands:",file=sys.stderr)
		print("  help [command]")
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
			print(" ",name," ".join(args),file=sys.stderr)
		exit(0)
	elif len(argv) == 3 and argv[1] == "help":
		if not argv[2] in functions.keys():
			error(f"'{argv[2]}' not found",code=E_NOTFOUND)
		help(f"numpy.{argv[2]}")
		exit(0)

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
		if function[""] in vararg:
			atype = function[""]
			args = atype(argv[2:])
		else:
			for arg in argv[2:]:
				spec = arg.split("=")
				if len(spec) < 2:
					if pos >= len(function[""]):
						error("too many positional argument",E_INVALID)
					atype = function[""][pos]
					args.append(atype(arg))
					pos += 1
				else:
					atype = function[spec[0]]
					kwargs[spec[0]] = atype(spec[1])
			while len(args) < len(function[""]):
				if sys.stdin.isatty():
					error("missing positional argument",E_INVALID)
				atype = function[""][pos]
				data = sys.stdin.readlines()
				args.append(atype(";".join(data)))
				pos += 1
		result = call(*args,**kwargs)
		output(result)
	except Exception as info:
		if config.exception:
			raise
		error(f"'{' '.join(argv[1:])}' failed - {info}",E_FAILED)

	exit(E_OK)

if __name__ == '__main__':
	main(sys.argv)
