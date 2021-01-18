![Master](https://github.com/dchassin/numpy-cli/workflows/Master/badge.svg)

# Numpy Command Line Interface (CLI)

This project provides a command-line interface (CLI) for the python numpy package.

## Installation

To install and validate `numpy-cli`:

~~~
sh# git clone https://github.com/dchassin/numpy-cli
sh# cd numpy-cli
sh# make install
sh# make validate
~~~

## Example

The following generates a CSV array with an 3x5 array of random number drawn from the standard normal distribution:

~~~
sh% numpy random.normal size=3,5
-0.45881967,1.4964296,2.2836597,0.36389488,0.094673802
1.2212669,-0.94511462,0.58411318,0.2714597,0.97800712
0.42732899,1.7809519,-0.77028383,0.741399,1.3907123
~~~
