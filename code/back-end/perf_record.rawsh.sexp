(Other
  "$ perf record -g ./barrier_bench.native\
 \nEstimated testing time 20s (change using -quota SECS).\
 \n \
 \n  Name        Time (ns)             Time 95ci   Percentage\
 \n  ----        ---------             ---------   ----------\
 \n  mutable     7_306_219   7_250_234-7_372_469        96.83\
 \n  immutable   7_545_126   7_537_837-7_551_193       100.00\
 \n \
 \n[ perf record: Woken up 11 times to write data ]\
 \n[ perf record: Captured and wrote 2.722 MB perf.data (~118926 samples) ]\
 \nperf record -g ./barrier.native\
 \nEstimated testing time 20s (change using -quota SECS).\
 \n \
 \n  Name        Time (ns)             Time 95ci   Percentage\
 \n  ----        ---------             ---------   ----------\
 \n  mutable     7_306_219   7_250_234-7_372_469        96.83\
 \n  immutable   7_545_126   7_537_837-7_551_193       100.00\
 \n \
 \n[ perf record: Woken up 11 times to write data ]\
 \n[ perf record: Captured and wrote 2.722 MB perf.data (~118926 samples) ]\
 \n")
