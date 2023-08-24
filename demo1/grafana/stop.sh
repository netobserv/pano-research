#!/bin/bash
sudo systemctl daemon-reload
sudo systemctl stop grafana-server
sudo systemctl status grafana-server
