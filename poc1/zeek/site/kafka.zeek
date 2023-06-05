#@load packages/zeek-kafka
@load Apache/Kafka

redef Kafka::topic_name = "";
redef Kafka::kafka_conf = table(
        ["metadata.broker.list"] = "localhost:9092"
);

event zeek_init()
{
    local protocol_list = table(
	# please keep alphabetized
	# protocol           = log_id of filter
        # ["bacnet" ]          = BACNET::Log_BACNET,
        # ["conn" ]            = Conn::LOG,
        # ["dce-rpc" ]         = DCE_RPC::LOG,
        # ["dhcp" ]            = DHCP::LOG,
        ["dns" ]             = DNS::LOG,
        # ["ftp" ]             = FTP::LOG,
        # ["http"]             = HTTP::LOG,
        # ["irc"]              = IRC::LOG,
        # ["kerberos"]         = KRB::LOG,
        # ["modbus"]           = Modbus::LOG,
        # ["mysql"]            = mysql::LOG,
        # ["ntlm"]             = NTLM::LOG,
        # ["ntp"]              = NTP::LOG,
        # ["profinet"]         = Profinet::Log_Profinet,
        # ["profinet-debug"]   = Profinet::Log_Profinet_Debug,
        # ["profinet-dce-rpc"] = Profinet::Log_Profinet_DCE_RPC,
        # ["radius"]           = RADIUS::LOG,
        # ["rdp"]              = RDP::LOG,
        # ["sip"]              = SIP::LOG,
        # ["smb-files"]        = SMB::FILES_LOG,
        # ["smb-mapping"]      = SMB::MAPPING_LOG,
        # ["smtp"]             = SMTP::LOG,
        # ["snmp"]             = SNMP::LOG,
        # ["ssh"]              = SSH::LOG,
        # ["ssl"]              = SSL::LOG,
        # ["ssl-env-fv"]       = SSL_ENC::FV_LOG,
        # ["tunnel"]           = Tunnel::LOG,
        # ["x509"]             = X509::LOG
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
}
