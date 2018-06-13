(Other
  "$ ./_build/default/barrier_bench.exe -help\
 \nBenchmark for mutable, immutable\
 \n\
 \n  barrier_bench.exe [COLUMN ...]\
 \n\
 \nColumns that can be specified are:\
 \n\ttime       - Number of nano secs taken.\
 \n\tcycles     - Number of CPU cycles (RDTSC) taken.\
 \n\talloc      - Allocation of major, minor and promoted words.\
 \n\tgc         - Show major and minor collections per 1000 runs.\
 \n\tpercentage - Relative execution time as a percentage.\
 \n\tspeedup    - Relative execution cost as a speedup.\
 \n\tsamples    - Number of samples collected for profiling.\
 \n\
 \nColumns with no significant values will not be displayed. The\
 \nfollowing columns will be displayed by default:\
 \n\ttime alloc percentage\
 \n\
 \nError Estimates\
 \n===============\
 \nTo display error estimates, prefix the column name (or\
 \nregression) with a '+'. Example +time.\
 \n\
 \n(1) R^2 is the fraction of the variance of the responder (such as\
 \nruntime) that is accounted for by the predictors (such as number of\
 \nruns).  More informally, it describes how good a fit we're getting,\
 \nwith R^2 = 1 indicating a perfect fit and R^2 = 0 indicating a\
 \nhorrible fit. Also see:\
 \nhttp://en.wikipedia.org/wiki/Coefficient_of_determination\
 \n\
 \n(2) Bootstrapping is used to compute 95% confidence intervals\
 \nfor each estimate.\
 \n\
 \nBecause we expect runtime to be very highly correlated with number of\
 \nruns, values very close to 1 are typical; an R^2 value for 'time' that\
 \nis less than 0.99 should cause some suspicion, and a value less than\
 \n0.9 probably indicates either a shortage of data or that the data is\
 \nerroneous or peculiar in some way.\
 \n\
 \nSpecifying additional regressions\
 \n=================================\
 \nThe builtin in columns encode common analysis that apply to most\
 \nfunctions. Bench allows the user to specify custom analysis to help\
 \nunderstand relationships specific to a particular function using the\
 \nflag \"-regression\" . It is worth noting that this feature requires\
 \nsome understanding of both linear regression and how various quatities\
 \nrelate to each other in the OCaml runtime.  To specify a regression\
 \none must specify the responder variable and a command separated list\
 \nof predictor variables.\
 \n\
 \nFor example: +Time:Run,mjGC,Comp\
 \n\
 \nwhich asks bench to estimate execution time using three predictors\
 \nnamely the number of runs, major GCs and compaction stats and display\
 \nerror estimates. Drop the prefix '+' to suppress error estimation. The\
 \nvariables available for regression include:\
 \n\tTime  - Time\
 \n\tCycls - Cycles\
 \n\tRun   - Runs per sampled batch\
 \n\tmGC   - Minor Collections\
 \n\tmjGC  - Major Collections\
 \n\tComp  - Compactions\
 \n\tmWd   - Minor Words\
 \n\tmjWd  - Major Words\
 \n\tProm  - Promoted Words\
 \n\tOne   - Constant predictor for estimating measurement overhead\
 \n\
 \n\
 \n=== flags ===\
 \n\
 \n  [-all-values]         Show all column values, including very small ones.\
 \n  [-ascii]              Display data in simple ascii based tables.\
 \n  [-ci-absolute]        Display 95% confidence interval in absolute numbers\
 \n  [-clear-columns]      Don't display default columns. Only show user specified\
 \n                        ones.\
 \n  [-display STYLE]      Table style (short, tall, line, blank or column).\
 \n                        Default short.\
 \n  [-fork]               Fork and run each benchmark in separate child-process\
 \n  [-geometric SCALE]    Use geometric sampling. (default 1.01)\
 \n  [-linear INCREMENT]   Use linear sampling to explore number of runs, example\
 \n                        1.\
 \n  [-load FILE]          Analyze previously saved data files and\
 \n                        don't run tests. [-load] can be specified multiple\
 \n                        times.\
 \n  [-no-compactions]     Disable GC compactions.\
 \n  [-overheads]          Show measurement overheads, when applicable.\
 \n  [-quota SECS]         Time quota allowed per test (default 10s).\
 \n  [-reduced-bootstrap]  Reduce the number of bootstrapping iterations\
 \n  [-regression REGR]    Specify additional regressions (See -? help).\
 \n  [-save]               Save benchmark data to <test name>.txt files.\
 \n  [-sexp]               Output as sexp.\
 \n  [-stabilize-gc]       Stabilize GC between each sample capture.\
 \n  [-v]                  High verbosity level.\
 \n  [-width WIDTH]        width limit on column display (default 200).\
 \n  [-build-info]         print info about this build and exit\
 \n  [-version]            print the version of this build and exit\
 \n  [-help]               print this help text and exit\
 \n                        (alias: -?)\
 \n\
 \n")
