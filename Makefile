.SUFFIXES:
	
all:
	@echo "Available targets:"
	@echo "  install    install to /usr/local/bin"
	@echo "  docs       update docs folder"
	@echo "  validate   validate installation"

install: /usr/local/bin/numpy

/usr/local/bin/numpy: src/numpy.py 
	@test ! -z "$$(which python3)" || (echo "ERROR: python3 not found"; false)
	@echo "#!$$(which python3)" > $@
	@cat $< >> $@
	@chmod +x $@
	@echo "Installed $< to $@ using $$(which python3)"

validate:
	@./autotest.sh

docs:
	rm -rf docs/*
	cp README.md docs
	numpy --makedocs

.PHONY: docs
