ulimit -s 1600000000
export OMP_NUM_THREADS=1
rm tmp00000.StreamerGridPointIterative.channel0; 

wt=3
#thrval=0.001
thrval=$1
inputfile=/home/chatzidp/gitlab/fabdata/data_010000-p.h5
#inputfile=/home/chatzidp/gitlab/fabdata/data_010000-rho.h5
#inputfile=/home/chatzidp/gitlab/fabdata/data_010000-E.h5
#inputfile=/home/chatzidp/gitlab/fabdata/data_010000-a2.h5

./hdf2ch -bpdx 16 -bpdy 16 -bpdz 16 -sim io -simdata $inputfile -outdata tmp -threshold $thrval -wtype_write $wt

# ./hdf2ch -bpdx 16 -bpdy 16 -bpdz 16 -sim io -simdata /home/chatzidp/gitlab/fabdata/data_010000-p.h5 -outdata tmp -threshold $1 -wtype_write 3
#./hdf2ch -bpdx 16 -bpdy 16 -bpdz 16 -sim io -simdata /home/chatzidp/gitlab/fabdata/data_010000-p.h5 -outdata tmp -threshold 0.001 -wtype_write 3
#./hdf2ch -bpdx 16 -bpdy 16 -bpdz 16 -sim io -simdata /home/chatzidp/gitlab/fabdata/data_010000-p.h5 -outdata tmp -threshold 0.01 -wtype_write 3
#./hdf2ch -bpdx 16 -bpdy 16 -bpdz 16 -sim io -simdata /home/chatzidp/gitlab/fabdata/data_010000-p.h5 -outdata tmp -threshold 0.0001 -wtype_write 3
#./ch2diff -simdata1 tmp00000.StreamerGridPointIterative.channel0 -simdata2 ref.channel0 -wtype 3

./ch2diff -simdata1 tmp00000.StreamerGridPointIterative.channel0 -simdata2 ref.channel0 -wtype $wt

./decompr -simdata1 tmp00000.StreamerGridPointIterative.channel0 -simdata2 ref.channel0 -wtype $wt

#valgrind --max-stackframe=4129784 ./hdf2ch -bpdx 2 -bpdy 2 -bpdz 2 -sim io -simdata /home/chatzidp/gitlab/fabdata/data_010000-p.h5 -outdata tmp -threshold 0.001 -wtype_write 3
#valgrind ./ch2diff -simdata1 tmp00000.StreamerGridPointIterative.channel0 -simdata2 ref.channel0 -wtype 3
