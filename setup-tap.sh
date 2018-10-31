#!/bin/bash
MYIFACE=enp0s3

sudo ip link add br0 type bridge
sudo ip addr flush dev $MYIFACE
sudo ip link set $MYIFACE master br0
sudo ip tuntap add dev tap0 mode tap group kvm
sudo ip link set tap0 master br0
sudo ip link set dev br0 up
sudo ip link set dev tap0 up promisc on
