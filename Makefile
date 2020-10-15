port=8194
host=cloudpoint1.bloomberg.com
health_check_port=80



run: build
	docker run --rm --name bpipe-mock-appliance \
	-p $(port):$(port) -p $(health_check_port):$(health_check_port) \
	--env HOST=$(host) \
	--env PORT=$(port) \
	--env HEALTH_CHECK_PORT=$(health_check_port) \
	bpipe-mock-appliance

rm:
	docker rm bpipe-proxy 2> /dev/null

build:
	docker build -t bpipe-mock-appliance .
