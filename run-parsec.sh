#!/bin/bash
# run parsec on a target host, results are generated under log/$BENCH-$TAG-$TIMESTAMP.runtime

# pthreads: whole benchmark suite; <name>: single benchmark (e.g. dedup)
BENCH="fluidanimate"
#BENCH="pthread"

# output file name tag, change it for each experiment
TAG="x1-3k-ple-test"

# default parameters
ESX="esx"
HOST="ubuntu1"
NR_THREADS=6
LOOP=3
PARSEC_PATH="~/parsec-2.1-inplace"

# -k: run in place, do not decompress from the input.tar, first run does not work with -k
# -c: build type (do not change)
CMD="cd $PARSEC_PATH; source env.sh; parsecmgmt -k -a run -p $BENCH -i native -n $NR_THREADS -c gcc-pthreads.pre"

# auto generated parameters
TIMESTAMP=`date +%m%d%y-%H%M`
LOG="$BENCH-$TAG-$TIMESTAMP.log"

# body
mkdir -p log
echo > log/$LOG

date | tee -a log/$LOG

for i in `seq 1 $LOOP`; do
  # reset if you need sched-stat data
  # ssh root@$ESX "sched-stats -r; sched-stats -s 1" | tee -a log/$LOG

  # costop-3k
  bash ./set-costop-3k.sh | tee -a log/$LOG
  (time fab -H $HOST cmd:"$CMD") 2>&1 | tee -a log/$LOG

  # costop-0
  # bash ./set-costop-0.sh | tee -a log/$LOG
  # (time fab -H $HOST cmd:"$CMD") 2>&1 | tee -a log/$LOG

  # dump sched-stats
  # ssh root@$ESX "vsi_traverse -o /vmfs/volumes/datastore1/log/$BENCH.log" | tee -a log/$LOG
done

date | tee -a log/$LOG

