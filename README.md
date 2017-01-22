Pi
===

This repository contains (one or more) custom Raspbian images.

Quick start
-----------

Flashing a custom Raspbian image onto an SD card is a two-step process:

1. Build the image inside the VM
2. Flash the image onto a SD card from the host machine
3. Run `sudo raspi-config --expand-rootfs` on the Pi

Build the image
---------------

Run:

```bash
IMAGE_HOSTNAME=test1 # ???
vagrant ssh --command "cd /vagrant && IMAGE_HOSTNAME=$IMAGE_HOSTNAME sudo -E script/buildscript"
```

Flash the image
---------------

Flashing the SD card must be done from the host machine, and mostly follows from [the instructions available on the Raspberry Pi Documentation](https://www.raspberrypi.org/documentation/installation/installing-images/README.md). Use the disk image file found in the current working directory.

### OS X

On OS X, you can run open Disk Utility to find the device name of your SD card reader, and execute the following in the terminal:

```
script/flash-osx $image $device
```

For the device name, Disk Utility will display it in the bottom-left corner when looking at your SD card reader:

![Disk utility screenshot](https://cloud.githubusercontent.com/assets/1623628/12372939/dfd7c22c-bc42-11e5-91c3-6e85b720dfb4.png)

For example, if (as in the image above) your device name is `disk2`, you would execute:

```
script/flash-osx disk2
```

Note: the above script spawns a root process (`dd`) to allow it to write to the device. You will need to enter your password when prompted.
