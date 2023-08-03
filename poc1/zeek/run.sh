#!/bin/bash
echo starting zeek
# IP_ADDR=10.144.101.177
# IP_ADDR=9.4.193.177
# IP_ADDR=127.0.0.1
IP_ADDR=pano.sl.cloud9.ibm.com

echo IP_ADDR is $IP_ADDR
cd logs
sudo /usr/local/zeek/bin/zeek \
	-D -C -B plugin-Zeek-PcapOverTcp \
	-i pcapovertcp::$IP_ADDR:57012 \
	/usr/local/zeek/share/zeek/site/local.zeek
