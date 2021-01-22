#!/bin/sh
echo "#$(which python3)" > /usr/local/bin/numpy
curl https://raw.githubusercontent.com/dchassin/numpy-cli/master/src/numpy.py >>/usr/local/bin/numpy
chmod +x /usr/local/bin/numpy
