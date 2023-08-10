#!/bin/bash
# dnsperf/build.sh
echo building flowlogs-pipeline...
cd flowlogs-pipeline
./build.sh
cd ..
echo building grafana...
cd grafana
./build.sh
cd ..
echo building kafka...
cd kafka
./build.sh
cd ..
echo building netobserve agent..
cd netobserv-ebpf-agent
./build.sh
cd ..
echo building prometheus...
cd prometheus
./build.sh
cd ..
echo building zeek...
cd zeek
./build.sh
cd ..
