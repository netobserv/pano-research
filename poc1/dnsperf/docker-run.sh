#!/bin/bash
docker run -d guessi/dnsperf:alpine -s 10.0.80.11 -d sample-query-data
