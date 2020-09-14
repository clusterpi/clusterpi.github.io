---
title: "Docker Installation"
linkTitle: "Installation"
weight: 10
description: >
  Install docker on a single Raspberry PI
---

First we need to make sure the Raspberry Pi is up to date so we can
install a recent version of docker.  The automated script maintained
by the Docker project will create a systemd service file and copy the
relevant Docker binaries into `/usr/bin/`.


```bash
pi$ sudo apt-get update
pi$ curl -sSL https://get.docker.com | sh
```

In order for us to start the docker daemon at the next boot, we add it
as follows:

```bash
pi$ sudo systemctl enable docker
```

Now if we reboot, the Docker daemon will start. In case you like to
avoid the first reboot, you can use the command:

```bash
pi$ sudo systemctl start docker
```

Naturally you do not have to do this after you reboot the next time.

The Docker client can only be used by `root` or members of the
`docker` group.  Thus, let us add the user pi (or your equivalent
user) to the docker group using:

```bash
pi$ sudo usermod -aG docker pi
```

After executing the previous command, we log out of the terminal restart
it so we are sure the user permissions are available in the shell we
use.

To test docker is installed successfully, we run the `hello-world`
docker image with the command:

```bash
pi$ docker run hello-world
```

If Docker is installed properly, we will see a `Hello from Docker!`
message.

## Excersise

1. Develop a cloudmesh cms program that given a range of hostnames or
   IPs deployes docker on all of them

2. Develops a cloudmesh cms program that verifies if docker is
   installed on a range of machines.

We suggest to have a command similar to

```cms docker --action=deploy --host="198.168.50.[10-20]"```

Please use cloudmeash Parameter.expand command to deal with the
hostnames and convert them to a list

A command template can be generated with

``` cms command generate doscker .```

Once you have cloudmesh installed. See for more details the cloudmesh
manual. Work with Gregor on this as we may already have a docker
command fro cloudmesh. The command template has already been created
and is available at

* <https://github.com/cloudmesh/cloudmesh-docker>

However, the command is not yet properly defined nor is the manual page verified

In addition we have a second repo that is dedicated to pi cluster
activities at

* <https://github.com/cloudmesh/cloudmesh-pi-cluster>

This repo also does not have a docker depoy command, However it has
k3s which may include docker deployment implicitly. This has to be
checked.

In any case the command docker deploy is missing and needs to be
implemented. This can done even with the help of either

*
<https://github.com/cloudmesh/cloudmesh-inventory/blob/master/cloudmesh/host/command/host.py>

or

* <https://github.com/cloudmesh/cloudmesh-job> 
