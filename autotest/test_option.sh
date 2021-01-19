. ${AUTOTEST:-.}/assert.sh

numpy -v
numpy --version
assert $(numpy version) = $(python3 -c "import numpy; print(numpy.__version__)")

numpy -e random.random
numpy --exception random.random

numpy -q random.random
numpy --quiet random.random

numpy -w random.random
numpy --warning random.random

numpy -d random.random
numpy --debug random.random
