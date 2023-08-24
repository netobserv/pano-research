#!/bin/bash
docker run -d guessi/dnsperf:alpine -s 8.8.8.8 -d dns-entry-list
