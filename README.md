# DWM-Arch-Installation
This is not a patented method. It depends on each person's needs. Therefore, there is no way to install a partition for swap here.

## Update the system clock
```shell
timedatectl status
timedatectl set-ntp true
```
## Partition the disks
```shell
lsblk
cfdisk
```
## Format the partitions
```sh
mkfs.ext4 /dev/root_partition
mkfs.fat -F 32 /dev/efi_system_partition
```
## Mount the file systems
```sh
mount /dev/root_partition /mntmnt
mount --mkdir /dev/efi_system_partition /mnt/boot
```
## Install essential packages
```sh
pacstrap -K /mnt base base-devel linux linux-firmware neovim networkmanager network-manager-applet grub efibootmgr linux-headers mtools git xdg-user-dirs
```
## Configure the systems
```sh
genfstab -U /mnt >> /mnt/etc/fstab
```
## Chroot
```sh
arch-chroot /mnt
```
## Time zone
```sh
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc
```
## Localization
Edit `/etc/locale.gen` and uncomment `en_US.UTF-8 UTF-8` and other needed locales. Generate the locales by running:
```sh
locale-gen
```
Create the `/etc/locale.conf` file, and set the LANG variable accordingly:
```sh
LANG=en_US.UTF-8
```
## Network Config
Create `/etc/hostname` with the name your host:
```sh
nameFromYourHost
```
Create `/etc/hosts`:
```sh
127.0.0.1   localhost
::1         localhost
127.0.0.1   nameFromYourHost.localdomain nameFromYourHost
```
