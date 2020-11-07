# R with different math libs  (was: r-with-intel-mkl)

Modified from the original at https://github.com/pachamaltese/r-with-intel-mkl

- Reordered/renamed the output dirs
- Added a shell script to help switching the libraries
- Added a shell script to run the benchmarks

Tested under:

- OS: Ubuntu 20.04.1 LTS x86_64 
- Kernel: 5.4.0-52-generic 
- Shell: bash 5.0.17 
- CPU: AMD Ryzen 3 3200U with Radeon Vega Mobile Gfx (4) @ 2.600GHz 
- GPU: AMD ATI 03:00.0 Picasso 
- Memory: 13972MiB 

*Note*:

- On the system described above, the Intel MKL (intel-mkl-64bit-2020.4-912) installed from the Intel repository, fails to finish de R benchmark

```
...

2800x2800 cross-product matrix (b = a' * a)_________ (sec):  2.21566666666667 
Error in solve(crossprod(a), crossprod(a, b)) : 
  the leading minor of order 1620 is not positive definite
Calls: system.time -> solve -> solve
Timing stopped at: 1.818 0.024 0.939
Execution halted

...

Cholesky Factorization
Error in chol.default(B) : 
  the leading minor of order 215 is not positive definite
Calls: system.time -> chol -> chol.default
Timing stopped at: 0.084 0.072 0.106
Execution halted
```

