#!/bin/bash
echo starting netobserv-eBPF-agent...
export INTERFACES=eth0
export FLOWS_TARGET_PORT=57012
export FLOWS_TARGET_HOST=127.0.0.1
export ENABLE_PANO=true
export LIBRARY_PATH=/usr/lib/$(gcc -print-multiarch)
export C_INCLUDE_PATH=/usr/include/$(gcc -print-multiarch)
export CPLUS_INCLUDE_PATH=/usr/include/$(gcc -print-multiarch)
sudo -E $HOME/src/shachee/bin/netobserv-ebpf-agent
