#!/bin/bash 
echo starting prometheus
cd prometheus-2.44.0.linux-amd64
# By default, Prometheus stores its database in ./data (flag --storage.tsdb.path).
./prometheus --config.file=prometheus.yml
