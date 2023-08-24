README
dnsperf: (anyone)
- ports: 53
- configure
- containerize
- run

kafka (anyone)
- ports: 9092, 9093
- configure
- containerized (done?)
- run

netobserv-ebpf-agent (shachee)
- ports: 57012
- containerize
- run

zeek (erich)
- ports: 57012, 9092
- configure (with kafka)
- containerize
- run

flowlogs-pipeline: (erich)
- ports: 9092, 80
- kafka-name: kakfa-dns
- figure out kafka integration,
- configure
- containerize
- run

prometheus (anyone)
- ports: 9090, 80
- configure
- containerized (done?)
- run

alert-manager (anyone)
- configure
- containerized (done?)
- run

graphana (anyone)
- ports: 80
- configure
- containerized (done?)
- run
