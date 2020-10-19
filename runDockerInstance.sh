#!/bin/sh


if [ -z "$BPIPEHOSTNAME1" ] ; then echo "No env variable BPIPEHOSTNAME1 defined "; exit -1; fi
if [ -z "$BPIPEHOSTNAME2" ] ; then echo "No env variable BPIPEHOSTNAME2 defined "; exit -1; fi
if [ -z "$BPIPEPORT" ] ; then echo "No env variable BPIPEPORT defined "; exit -1;fi
if [ -z "$HEALTH_CHECK_PORT" ]; then echo "No health check port defined"; exit -1; fi


docker run -dit  \
	-p ${BPIPEPORT}:${BPIPEPORT} \
    -p ${HEALTH_CHECK_PORT}:${HEALTH_CHECK_PORT} \
	-e HOST1=${BPIPEHOSTNAME1} \
    -e HOST2=${BPIPEHOSTNAME2} \
	-e PORT=${BPIPEPORT} \
	-e HEALTH_CHECK_PORT=${HEALTH_CHECK_PORT} \
	bpipe-appliance-proxy:v0.alpine