#!/bin/bash
dnsperf -d ./dns-entry-list -s 9.0.0.1 -t 20 -l 3000 -Q 100
