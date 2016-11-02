.PHONY: build
build:
	docker build -t epiphany .

.PHONY: run
run: build
	xhost +local:docker
	docker run -ti --rm \
	-v /dev/dri:/dev/dri:rw \
	-e DISPLAY=$$DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $$(pwd)/index.html:/index.html \
	epiphany
