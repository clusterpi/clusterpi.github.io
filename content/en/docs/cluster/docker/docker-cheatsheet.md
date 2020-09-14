---
title: "Docker Cheatsheet"
linkTitle: "Cheatsheet"
description: >
  The docker cheatsheet
weight: 90
---

The following table is copied from the
[docker manual](https://github.com/docker/labs/blob/master/developer-tools/java/chapters/appa-common-commands.adoc)


| Purpose| Command |
| ---- | ------------ |
| **Image** | |
| Build an image| docker image build --rm=true . |
| Install an image | docker image pull ${IMAGE} |
| List of installed images | docker image ls |
| List of installed images (detailed listing) | docker image ls --no-trunc |
| Remove an image | docker image rm ${IMAGE_ID} |
| Remove unused images | docker image prune |
| Remove all images | docker image rm $(docker image ls -aq) |
| **Containers** | |
| Run a container | docker container run |
| List of running containers | docker container ls |
| List of all containers | docker container ls -a |
| Stop a container | docker container stop ${CID} |
| Stop all running containers | docker container stop $(docker container ls -q) |
| List all exited containers with status 1 | docker container ls -a --filter "exited=1" |
| Remove a container | docker container rm ${CID} |
| Remove container by a regular expression | docker container ls -a `|` grep gregor `|` awk '{print $1}' `|` xargs docker container rm -f |
| Remove all exited containers | docker container rm -f $(docker container ls -a `|` grep Exit `|` awk '{ print $1 }') |
| Remove all containers | docker container rm $(docker container ls -aq) |
| Find IP address of the container | docker container inspect --format '{{ .NetworkSettings.IPAddress }}' ${CID} |
| Attach to a container | docker container attach ${CID} |
| Open a shell in to a container | docker container exec -it ${CID} bash |
| Get container id for an image by a regular expression | docker container ls | grep gregor | awk '{print $1}' |


