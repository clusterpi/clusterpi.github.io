---
title: "Docker Installation"
linkTitle: "Installation"
weight: 10
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

