FROM ubuntu:16.04
WORKDIR /root
RUN apt-get update && apt-get --assume-yes install bc build-essential curl libncurses5-dev unzip
RUN curl -sL 'https://github.com/raspberrypi/linux/archive/rpi-4.4.y.tar.gz' | tar xz
RUN curl -sL 'https://github.com/raspberrypi/tools/archive/master.tar.gz' | tar xz
ENV PATH $PATH:/root/tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin
ENV KERNEL kernel7
WORKDIR /root/linux-rpi-4.4.y
