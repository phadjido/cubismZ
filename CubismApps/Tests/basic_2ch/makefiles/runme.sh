# 
make clean;make wavz=0 drain=1 zlib=0 
make data_generator
./data_generator
./tests -sim io
../../../tools/ch2hdf/ch2hdf -simdata output00000.StreamerGridPointIterative.channel0 -h5file out0
../../../tools/ch2hdf/ch2hdf -simdata output00000.StreamerGridPointIterative.channel1 -h5file out1
#paraview out1.xmf

