all: examples

deps:
	bash install_hdf5.sh

lib: deps
	LIBRARY_PATH=c_hdf5/lib \
	CPATH=c_hdf5/include \
	dub build

examples: lib
	cd examples && \
	bash run_examples.sh