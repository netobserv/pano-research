@load packages/zeek-kafka
redef Kafka::topic_name = "";
redef Kafka::kafka_conf = table(
        ["metadata.broker.list"] = "localhost:9092"
);

event zeek_init()
{
    local protocol_list = table(
        # please keep alphabetized
        # protocol           = log_id of filter
        ["dns" ]             = DNS::LOG,
    );

    for (proto, log_id in protocol_list ) {
        local this_filter: Log::Filter = [
            $name = "kafka-" + proto,
            $writer = Log::WRITER_KAFKAWRITER,
                $config = table(
                    ["metadata.broker.list"] = "localhost:9092"
                ),
            $path =  proto
        ];
        Log::add_filter(log_id, this_filter);
    }

