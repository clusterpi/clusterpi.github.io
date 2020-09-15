---
title: "417: Kubernetes Cluster in Raspberry Pi"
linkTitle: "417: Kubernetes Cluster in Raspberry Pi"
description: >
  Incomplete, should be replaced
---

NOTE: THIS PROJECT IS INCOMPLETE AND OUTDATED

* This is a project from Spring 2018, so its likely outdated
* all the shs scripts were not properly added and gregor had to add
  them in this md. 
* code should be in code repository, but not documentation repo
* There is to much unneded code here
* codes should use cloudmesh shell not shell scripts
* code shows lots of things that need to be done by hand which is not
  needed if it were to be properly automated
* a single line of cold should be able to configure "ALL" workers and
  also the head node

The original is at

*
https://github.com/cloudmesh-community/hid-sp18-417/tree/master/deprecated/tutorial/automate

*
https://github.com/cloudmesh-community/hid-sp18-417/blob/master/deprecated/tutorial/pi-kubernetes.md

The student may have switched to doing kubernetes on google, Bu that
seems to be just a manaul and deos not include a project

* https://github.com/cloudmesh-community/hid-sp18-417/tree/master/project-code/gcloud

This section of the tutorial is targeting to automate the Kubernetes cluster setup in
Raspberry pi.

## opt_setup.sh

This is an optional setup if its required to download the cloudmesh code from 417 repo

```bash
#!/bin/sh
hostname=$1
ip=$2 # should be of format: 192.168.1.100
sudo apt-get update
sudo apt-get install git
mkdir /~/cloudmesh
echo installing git
git clone https://github.com/cloudmesh-community/hid-sp18-417.git
cd *417/tutorial/dhcp
echo running initial dhcp setup
```

``
sh opt_setup.sh
``




## dhcp_setup.sh

This Script will help setting up the dhcp static ip.

Please note that the shell script will execute the recommended reboot after the static IP assignment.

It needs four params:
   - hostname
   - desired static ip
   - router ip
   - dns server ip

``
sh dhcp_setup.sh <hostname> <nodeIP> <routerIP> <dnsIP>
``
```bash
#!/bin/sh

hostname=$1
ip=$2 # should be of format: 192.168.1.100
router=$3 # should be of format: 192.168.1.1
dns=$4 # should be of format: 192.168.1.1

# Change the hostname
touch hostname
sudo cat <<end>> hostname
$hostname
end
sudo cp hostname /etc/hostname

head -n -1 /etc/hosts > temp ; sudo mv temp /etc/hosts
sudo cat <<end11>> /etc/hosts
127.0.0.1     $hostname
end11

# Set the static ip

sudo cat <<EOT >> /etc/dhcpcd.conf
interface eth0
static ip_address=$ip/24
static routers=$router
static domain_name_servers=$dns

interface wlan0
static ip_address=$ip/24
static routers=$router
static domain_name_servers=$dns
EOT
reboot


```

## docker_setup.sh

Now Install docker and turn off the swap memory.
This shell will reboot the node per recommendation of the references.

``
sh docker_setup.sh
``

ERROR THIS SCRIPT DOES NOT EXIST IN THE 417 DIR


The previous shell scripts are common in both worker and head.

Maybe the student meant install_docker.sh

```bash
#!/bin/sh

# Install Docker
curl -sSL get.docker.com | sh && \
  sudo usermod pi -aG docker

# Disable Swap
sudo dphys-swapfile swapoff && \
  sudo dphys-swapfile uninstall && \
  sudo update-rc.d dphys-swapfile remove
echo Adding " cgroup_enable=cpuset cgroup_enable=memory" to /boot/cmdline.txt and rebooting...
sudo cp /boot/cmdline.txt /boot/cmdline_backup.txt
# if you encounter problems, try changing cgroup_memory=1 to cgroup_enable=memory.
orig="$(head -n1 /boot/cmdline.txt) cgroup_enable=cpuset cgroup_memory=1"
echo $orig | sudo tee /boot/cmdline.txt
reboot
```

## kube_head_setup.sh

To be executed only on the master.
This will initiate kubectl master and setup networking[debugging now]

``
sh kube_head_setup.sh
``
Please save the join token for the workers

```bash
# Add repo list and install kubeadm
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
  echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list && \
  sudo apt-get update -q && \
  sudo apt-get install -qy kubeadm
sudo kubeadm init --token-ttl=0 --apiserver-advertise-address=<internal master ip>
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
echo setting up network...installing weave
kubectl apply -f \
 "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
```

## kube_worker_setup.sh

 To be executed in the worker nodes

``
sh kube_worker_setup.sh
``

```bash
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
  echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list && \
  sudo apt-get update -q && \
  sudo apt-get install -qy kubeadm
echo now run the join token to join the cluster
```

## Other files

otherfiles that are not properly documented include

kubeadm_conf.yaml

```yaml
apiVersion: kubeadm.k8s.io/v1alpha1
kind: MasterConfiguration
controllerManagerExtraArgs:
  pod-eviction-timeout: 10s

```

There is also a dir called join that apparently has the join command
that is also not properly documented

```
kubeadm join 10.0.1.104:6443 --token w7hmjs.tgt6hqss5i30bpvc --discovery-token-ca-cert-hash sha256:24321005a87fa8803b470e141cef51688ad411bf52d98c05488aa0f46ae8194a
```

Also there is no reason we need to bother about the token it should be
safed with our cloudmesh shell and than reused.
