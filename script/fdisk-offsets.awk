# Parsing something like so:
#
#
#    Disk 2015-11-21-raspbian-jessie-lite.img: 1.4 GiB, 1458569216 bytes, 2848768 sectors
#    Units: sectors of 1 * 512 = 512 bytes
#    Sector size (logical/physical): 512 bytes / 512 bytes
#    I/O size (minimum/optimal): 512 bytes / 512 bytes
#    Disklabel type: dos
#    Disk identifier: 0xb3c5e39a
#
#    Device                               Boot  Start     End Sectors  Size Id Type
#    2015-11-21-raspbian-jessie-lite.img1        8192  131071  122880   60M  c W95 FAT32 (LBA)
#    2015-11-21-raspbian-jessie-lite.img2      131072 2848767 2717696  1.3G 83 Linux
#
#

BEGIN {
    devices = 0
    units = 1
    printf "Device offsets\n"
}

/^Units: / {
    units = $8
}

/^Device/ {
    devices = 1
    next
}

devices == 1 && /^./ {
    printf ("%s\t%10s\t%s\n", $1, $2 * units, substr($0, index($0, $7)))
}
