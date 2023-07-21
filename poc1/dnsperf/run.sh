#!/bin/bash
dnsperf -d ./dns-entry-list -s 8.8.8.8 -t 20 -l 3000 -Q 1000
