#!/bin/sh
echo "#!$(which python3)" >/usr/local/bin/numpy
curl -sL https://raw.githubusercontent.com/dchassin/numpy-cli/master/src/numpy.py >>/usr/local/bin/numpy
chmod +x /usr/local/bin/numpy
ln -sF /usr/local/bin/numpy /usr/local/bin/numpy_cli.py
