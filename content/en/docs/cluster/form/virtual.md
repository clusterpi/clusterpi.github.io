---
title: "Virtual Raspberry Cluster"
linkTitle: "Pi Cluster Form Factor"
weight: 90
description: >
  Description of how to use a virtual raspberry I cluster.
---

It should also be possible to create a virtual raspberry PI cluster
while for example using virtual box. This requires two steps. First the
deployment of a virtualized Raspberry PI. The following information may
be useful for this

* <http://dbakevlar.com/2015/08/emulating-a-raspberry-pi-on-virtualbox/>

The next step includes the deployment of multiple VMs emulating
Raspberry's. Naturally each should have its own name so you can
distinguish them. Instead of just using the GUI, it would be important
to find out how to start them from a command line as a shell script as
well as tear them down.

Next you will need to make sure you can communicate from the Pi's to each
other. This is naturally the same as on a real cluster

TODO: *TODO: provide a section*

This can be chosen as part of your project, but you need to develop a
cloudmesh command for managing the cluster. This includes starting and
stopping as well as check-pointing the cluster from a cloudmesh command.
Furthermore you need to benchmark it and identify how to do this and
contrast this to other clusters that you may start or have access to.
Please get in contact with Gregor. This project is reserved for online
students, as residential students will have access to real Raspberry PI
hardware.

Please note that this project may have to use QEMU.
