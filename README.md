# SolidRun demo runtime

This repository can build a complete runtime that can be flashed onto an SD card for HummingBoard IIOT & RZ/V2N SOM platform.

## Extensions

| Name | Description |
|---------|-------------|
| [weston-demo](./extensions/weston-demo/) | weston desktop environment + test apps|

### Prerequisites

- [Avocado CLI](https://github.com/avocado-linux/avocado-cli)
- Docker
- Target hardware

## Getting Started

- **`avocado install`** - Download SDK and dependencies
- **`avocado build`** - Compile extensions and assemble kos runtime
- **`avocado provision`** - Flash image to SD

## Example for HummingBoard IIOT & RZ/V2N

Install SDK dependencies:

```sh
$ avocado install -f
```

Build all listed extensions and runtime:

```sh
$ avocado build
```

Flash image to SD card:

Make sure automouting is disabled (on e.g. Ubuntu distros):

```sh
$ gsettings set org.gnome.desktop.media-handling automount false
$ gsettings set org.gnome.desktop.media-handling automount-open false
```

Run provision tool:
```sh
$ avocado provision -r solidrun --profile sd
```

Plug in SD card and follow on screen instructions. You should see a similar log:

```sh
$ avocado provision -r solidrun --profile sd
[INFO] Provisioning runtime 'solidrun'
[INFO] Running SDK lifecycle hook 'avocado-provision' for 'solidrun'.
[INFO] Running stone provision.
  Input directories:
    - /opt/_avocado/rzv2n-sr-som/output/runtimes/solidrun/stone
[INFO] Provisioning storage device 'rootdisk'.
[INFO] Building image 'boot' in device 'rootdisk'.
[INFO] Building FAT image 'boot' -> 'boot.img'.
[SUCCESS] Built FAT image 'boot.img'.
[INFO] Building image 'rootfs' in device 'rootdisk'.
[INFO] Building image 'var' in device 'rootdisk'.
[WARNING] The following environment variables are referenced but not set or empty in the caller's environment: AVOCADO_DEVICE_CERT, AVOCADO_DEVICE_ID, AVOCADO_DEVICE_KEY
[INFO] Executing provision script '/opt/_avocado/rzv2n-sr-som/output/runtimes/solidrun/stone/stone-provision-sd.sh'.

==========================================
Avocado SD Card Provisioning
RZ/V2N SolidRun SoM
==========================================

Images:
  boot   : /opt/_avocado/rzv2n-sr-som/output/runtimes/solidrun/stone/_build/boot.img
  rootfs : /opt/_avocado/rzv2n-sr-som/output/runtimes/solidrun/stone/avocado-image-rootfs-rzv2n-sr-som.erofs-lz4
  var    : /opt/_avocado/rzv2n-sr-som/output/runtimes/solidrun/stone/avocado-image-var-rzv2n-sr-som.btrfs

Recording existing block devices...
Existing devices: none

Please insert your SD card and press Enter to continue...
Waiting for new block device...

Detected new device: /dev/sda
Waiting for device to be ready...

SD card detected:
  Device : /dev/sda
  Size   : ? GiB
  Vendor : Generic
  Model  : STORAGE DEVICE

WARNING: This will completely erase /dev/sda!
All data on this ? GiB device will be lost.

Are you sure you want to continue? (y/N): y

Creating partition table...
Partition #1 contains a vfat signature.
Partition #2 contains a erofs signature.
Partition #3 contains a btrfs signature.
Partition table written.

Writing boot image to /dev/sda1...
128+0 records in
128+0 records out
134217728 bytes (134 MB, 128 MiB) copied, 10.0428 s, 13.4 MB/s
Boot partition written.

Writing rootfs image to /dev/sda2...
61+1 records in
61+1 records out
64737280 bytes (65 MB, 62 MiB) copied, 3.55614 s, 18.2 MB/s

Writing var image to /dev/sda3...
301+0 records in
301+0 records out
315621376 bytes (316 MB, 301 MiB) copied, 17.4329 s, 18.1 MB/s

==========================================
SD card written successfully!
You can now safely remove the card and boot your device.
==========================================
[SUCCESS] Provision script 'stone-provision-sd.sh' completed successfully.
[SUCCESS] Provision completed.
[SUCCESS] Successfully ran SDK lifecycle hook 'avocado-provision' for target 'rzv2n-sr-som'.
[SUCCESS] Successfully provisioned runtime 'solidrun'
```

