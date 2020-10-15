# B-PIPE Proxy Image

A proxy docker image that can be used to test network connectivity to cloud based BPIPE appliances in the cloud.

This image will launch a NGINX proxy that will direct traffic to a live Bloomberg B-PIPE appliance, for example a Zero Footprint node.

Downstream applications will need to handle authentication like in a regular B-PIPE deployment.

### Health Check:
To help deploy this application on ECS/K8 behind a load balancer, a health check endpoint endpoint is provided at `/health` on a configurable port (defaults to 80). It will return `200 OK` upon request.

Note that this is a dummy and is used only to prevent the LB target group from shutting down the container.

## To run locally:
* `make run` : This will point you to a ZFP B-PIPE at port 8194, with healthcheck on port 80.
* `make run host=1223.bbg.com port=8194 health_check_port=8888` : This example sets all the parameters manually.

