Raspberries
===========

This repository contains (one or more) custom Raspbian images.

Quick start
-----------

Flashing a custom Raspbian image onto an SD card is a two-step process:

1. Build the image inside the VM
2. Flash the image onto a SD card from the host machine

Build the image
---------------

Run:

```
vagrant ssh --command "cd workspace && sudo script/buildscript"
```

Flash the image
---------------

Flashing the SD card must be done from the host machine, and mostly follows from [the instructions available on the Raspberry Pi Documentation](https://www.raspberrypi.org/documentation/installation/installing-images/README.md). Use the `raspbian.img` file found in the current working directory.
