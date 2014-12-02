# This file describes how to build Plone into a runnable linux container with all dependencies installed
# To build:
# 1) Install docker (http://docker.io)
# 2) Run:
# docker run -d <imageid>
#
# VERSION                0.3
# DOCKER-VERSION        1.3.2

from        ubuntu:14.04
MAINTAINER Gauthier C.
run        apt-get update && apt-get -y install software-properties-common 
run	   add-apt-repository ppa:serge-hallyn/virt &&  apt-get update
run        DEBIAN_FRONTEND=noninteractive  apt-get upgrade -y 
run	   DEBIAN_FRONTEND=noninteractive  apt-get -y install xserver-xspice libpam-ldapd lxde-core lxterminal
ADD	   spiceqxl.xorg.conf /root/	   
ADD 	   run.sh	/root/
VOLUME	   ["/home"]
expose     5900
cmd        /root/run.sh