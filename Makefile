# Build the kdp-matsciml image

# Default target
all: kdp-matsciml

# Build system-image:
image-sys:
	docker build -t image_sys docker/sys

# Build git-image:
image-git:
	docker build -t image_git docker/git

# Build install image:
build-install: image-git image-sys
	docker build -t image_install docker/install --build-arg="IMAGE_GIT=image_git" --build-arg="IMAGE_SYS=image_sys"

# Build the config image:
build-config: build-install
	docker build -t image_config docker/config --build-arg="IMAGE_INSTALL=image_install"

# Build kdp-matsciml image:
kdp-matsciml: build-config
	docker build -t kdp-matsciml docker/matsciml --build-arg="IMAGE_KDP=image_config"

# Clean up images
clean:
	docker rmi image_sys image_git image_install image_config

