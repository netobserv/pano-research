#!/bin/bash
docker exec kafka /opt/bitnami/kafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic dns
