#!/bin/bash
#
# genref.sh
# CubismZ
#
# Copyright 2017 ETH Zurich. All rights reserved.
#
set -x #echo on

h5file=../Data/small.h5

bs=32	# block size (per dimension) (total: bs^3)
ds=128	# domain size (per dimension) (total: ds^3)
nb=4	# number of blocks (per dimension) (total: nb^3) # $(echo "$ds/$bs" | bc)

rm -f ref.cz	# remove any previous instance of the reference file ref.cz

# 1x1x1 process grid with 16^3 blocks

export OMP_NUM_THREADS=1
mpirun -n 1 ../../Tools/bin/default/hdf2cz -xpesize 1 -ypesize 1 -zpesize 1 -bpdx 4 -bpdy 4 -bpdz 4 -h5file $h5file -czfile ref.cz

# 2x2x2 process grid with 8^3 blocks on each process
# mpirun -n 8 ../../Tools/bin/default/hdf2cz -xpesize 2 -ypesize 2 -zpesize 2 -bpdx 2 -bpdy 2 -bpdz 2 -h5file $h5file -czfile ref.cz
