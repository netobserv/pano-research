#!/bin/bash
echo starting zeek
cd logs
sudo /usr/local/zeek/bin/zeek \
	-D -C -B all \
	-i pcapovertcp::127.0.0.1:57012 \
	/usr/local/zeek/share/zeek/site/local.zeek
