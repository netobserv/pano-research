#!/bin/bash
echo starting kafka
cd kafka

KAFKA_CLUSTER_ID="syaq2FnBRQCq6sXR7hnK8w"
bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c config/kraft/server.properties

# Start the Kafka broker service
bin/kafka-server-start.sh config/kraft/server.properties > kafka.out
