#!/bin/bash
#docker build ./ -f ./Dockerfile -t pano-zeek:5.0.9
docker build ./ -f ./Dockerfile.debugging -t zeek-debug:5.0.9
docker build ./ -f ./Dockerfile.pano -t pano-zeek-debug:5.0.9
