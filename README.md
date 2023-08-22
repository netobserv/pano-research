# PANO -- Payload Aware Network Observability

Welcome to the site for Payload Aware Network Observability (PANO).

## Background

## Components

- RedHat's [NetObserv eBPF Agent](https://github.com/netobserv/netobserv-ebpf-agent)
- The [Zeek Network Security Monitoring Tool](https://zeek.org/)
- Apache [Kafka](https://kafka.apache.org/)
- RedHat's [Flowlogs Pipeline](https://github.com/netobserv/flowlogs-pipeline)
- CNCF's [Prometheus](https://prometheus.io/)
- Grafana Labs [Grafana](https://grafana.com/)

## Changes

Changes needed to the components consisted of the following:

- Extentions to the [NetObserv eBPF Agent](https://github.com/netobserv/netobserv-ebpf-agent) to allow Full Packet Capture using eBPF, instead of flow-logs;
- An [Open-Soure Package](https://github.com/emnahum/zeek-pcapovertcp-plugin) that provides [PCAP-over-TCP functionality](https://www.netresec.com/?page=Blog&month=2022-08&post=What-is-PCAP-over-IP) to the [Zeek Network Security Monitoring Tool](https://zeek.org/)
- Configuration (but no code changes) to [Flowlogs Pipeline](https://github.com/netobserv/flowlogs-pipeline). Get the config file [here](poc1/flowlogs-pipeline/pano-kafka-dns.yaml).
- Configuration (but no code changes) to [Grafana](https://grafana.com/) to add a DNS dashboard. Get the dashboard [here](poc1/grafana/pano-dns-dashboard.json). 

## Use Case: DNS

To illustrate PANO, we demonstrate a use case with DNS.  We configure the [NetObserv eBPF Agent](https://github.com/netobserv/netobserv-ebpf-agent) to capture all packets on UDP Port 53, the default DNS port.  

## Workload

In addition to our pipeline, we use two instances of a DNS load tool, DNS-OARC's [dnsperf](https://github.com/DNS-OARC/dnsperf), which queries 8.8.8.8 (Google) and 9.0.0.1 (IBM) simultaneously, using a sample DNS [querylist](poc1/dnsperf/dns-entry-list) from a trace taken at yorktown.ibm.com

## Running the Demo

The following is needed to demo PANO's capabilities:

### Requirements

- Linux
- Git - to check out the tree
- Bash - to build the docker images from standard components
- Docker and docker compose that support "host" networking
- Relatively new Linux Kernel that supports CAP_BPF

### Building the Demo

Run `build-me.sh` in the PoC1 subdirectory:

`build-me.sh`

You should see various component images downloading and some building.

### Running the Demo

Run `docker compose up -d` in the PoC1 subdirectory:

```
docker compose up -d
```

You should see the various components come up:
```
Creating kafka                ... done
Creating grafana              ... done
Creating netobserv-ebpf-agent ... done
Creating prometheus           ... done
Creating flowlogs-pipeline    ... done
Creating zeek                 ... done
Creating dnsperf2             ... done
Creating dnsperf1             ... done
```

Now in a browser window, go to:

```
http://pano.sl.cloud9.ibm.com:3000/
```

(if you are running on a different machine, substitute `your-domain-name` for `pano.sl.cloud9.ibm.com`)

The first time you do this, Grafana will ask you to log in.  The credentials are "admin" and "admin".  Don't change them, skip the password reset.

You should see a Welcome page:

![Grafana Welcome Page](images/grafana-welcome.png)

In the lower left corner, click on the `PANO DNS Metrics`.

You should see something like the following:

![Grafana DNS Page](images/grafana-pano.png)

(at first the page will not display anything, but in about 10-15 seconds it should start to populate)
