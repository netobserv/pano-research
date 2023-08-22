# PANO -- Payload Aware Network Observability

Welcome to the site for Payload Aware Network Observability (PANO).

## Background

## Components

- RedHat's [NetObserv eBPF Agent](https://github.com/netobserv/netobserv-ebpf-agent)
- The [Zeek Network Security Monitoring Tool](https://zeek.org/)
- Apache [Kafka](https://kafka.apache.org/)
- RedHat's [Flowlogs Pipeline](https://github.com/netobserv/flowlogs-pipeline)
- CNCF's [Prometheus] (https://prometheus.io/)
- Grafana Labs [Grafana](https://grafana.com/)

## Changes

## Use Case: DNS

## Workload

- DNS-OARC's [dnsperf](https://github.com/DNS-OARC/dnsperf)

## Demo

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
