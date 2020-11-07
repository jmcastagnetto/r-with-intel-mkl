#! /bin/bash

if [ $# -eq 0 ]
then
	echo "Usage: $0 <lib>"
	echo ""
	echo "We need one test parameter between 1 and 4 to identify the library used by R"
	echo ""
	echo "Where <lib> is one of the following numbers"
	echo "1 = to use defaults"
	echo "2 = to use OpenBLAS"
	echo "3 = to use Atlas"
	echo "4 = to use Intel MKL"
	echo ""
	exit
fi

selectedlib=`expr $1 + 0`

declare -A mlibs
mlibs[1]="default"
mlibs[2]="openblas"
mlibs[3]="atlas"
mlibs[4]="intel-mkl"

output_dir="0${selectedlib}-r-cran-${mlibs[$selectedlib]}-results"
echo "Using the ${mlibs[$selectedlib]} library"
echo "Saving logs in ${output_dir}"

Rscript 00-benchmark-scripts/1-r-benchmark-25.R | tee ${output_dir}/results-benchmark25.log
Rscript 00-benchmark-scripts/2-revo-script.R | tee ${output_dir}/results-revoscript.log

ls -l ${output_dir}
