#!/bin/bash
echo starting zeek
cd logs
sudo /usr/local/zeek/bin/zeek \
	-i pcapovertcp::127.0.0.1:57012 \
	-e 'redef LogAscii::use_json = T;' \
	-D -C -B all \
	/usr/local/zeek/share/zeek/site/local.zeek
