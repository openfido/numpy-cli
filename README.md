![Master](https://github.com/dchassin/numpy-cli/workflows/Master/badge.svg)

# Numpy Command Line Interface (CLI)

This project provides a command-line interface (CLI) for the python numpy package.

# Documentation

Online documentation is available from the [SLAC GISMo Document Browser](http://docs.gridlabd.us/index.html?owner=dchassin&project=numpy-cli&branch=master&folder=&doc=/README.md).

## Prerequisites

The `numpy-cli` requires python3 and numpy.  Please consult the installation procedures for these tools if they are not already installed.  See https://python.org/ and https://numpy.org for details.

## Quick install

The easiest way to install the `numpy-cli` is to run the following command

~~~
curl -sL https://raw.githubusercontent.com/dchassin/numpy-cli/master/install.sh | sh
~~~

This command installs the `numpy` command in `/usr/local/bin`.  You should add this folder to your shell `PATH` if you have not already done so. Note that if you have not already installed the `numpy` module using `python3 -m pip install numpy`, using the `numpy` command will automatically do so for the current user only. 

## Developer install

To install and validate `numpy-cli`:

~~~
sh# git clone https://github.com/dchassin/numpy-cli
sh# cd numpy-cli
sh# make install
sh# make validate
~~~

## Examples

### Example 1

The following generates a 3x5 CSV array of random numbers drawn from the standard normal distribution:

~~~
sh% numpy random.normal size=3,5
-0.45881967,1.4964296,2.2836597,0.36389488,0.094673802
1.2212669,-0.94511462,0.58411318,0.2714597,0.97800712
0.42732899,1.7809519,-0.77028383,0.741399,1.3907123
~~~

### Example 2

The following transposes the result of the Example 1:

~~~
sh% numpy random.normal size=3,5 | numpy transpose
0.48714749,0.57812237,0.32112621
-0.30149098,0.74261362,0.0081088468
-0.7004004,-1.616231,1.2450845
1.513378,-0.072733548,1.3628931
0.29747421,0.82542784,0.31864684
~~~

### Example 3

A matrix can provided as a URL:

~~~
sh% echo "1,2;3,4" > /tmp/A
sh% numpy transpose file:///tmp/A
1,3
2,4
~~~  

### Example 4

Using the `--flatten` option generates a string with semicolons instead of line feeds or carriage returns:

~~~
sh% numpy -f random.normal size=2,2
-1.1391251,0.28421301;0.67772248,-0.24125024;
~~~

### Example 5

Many functions support complex numbers:

~~~
sh% numpy angle '1+2j,3+4j'
1.1071487,0.92729522
~~~
