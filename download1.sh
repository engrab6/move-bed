#!/bin/bash

echo "first $1";
echo "last $2";
#server="uqyche38@goliath.labs.eait.uq.edu.au"
server="uqyche38@awoonga.qriscloud.org.au"
#server_prefix="~/macondo/0.2r_10.0Ga_0.3gap/"
#server_prefix="~/macondo/small/1/"
server_prefix="/30days/uqyche38/0.01v_0.01nu_40l_30x_10y/"
IFS=$'\n'
#local_prefix=/media/pzhang/My\ Book/move-bed-tmp/macondo/0.003r_20.0Ga_0.3gap/
local_prefix=/media/pzhang/Elements/move-bed-tmp/macondo/0.01v_0.01nu_40l_30x_10y/1/
#local_prefix=/media/pzhang/My\ Book/dune_shape/small/1/
file_prefix="test_mvbed_s_"
echo $server_line
for i in $(seq $1 $2);
do
	scp -r $server:$server_prefix$file_prefix$(printf %04d $i).h5 $local_prefix
	# scp -r uqyche38@goliath.labs.eait.uq.edu.au:~/macondo/0.5r_10.0Ga_0.3gap/test_mvbed_c_$(printf %04d $i).xmf ;
	scp -r $server:$server_prefix$file_prefix$(printf %04d $i).xmf $local_prefix
	python process.py $local_prefix$file_prefix $i $i
done;
