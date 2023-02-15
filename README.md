# DWM-Arch-Installation
This is not a patented method. It depends on each person's needs. Therefore, there is no way to install a partition for swap here.

## Table of Contents
- [Arch Installation](#arch-installation)
- [DWM Installation](#dwm-installation)

# Arch Installation 
## Update the System Clock
```shell
timedatectl status
timedatectl set-ntp true
```
## Partition the Disks
```shell
lsblk
cfdisk
```
## Format the Partitions
```sh
mkfs.ext4 /dev/root_partition
mkfs.fat -F 32 /dev/efi_system_partition
```
## Mount the File Systems
```sh
mount /dev/root_partition /mntmnt
mount --mkdir /dev/efi_system_partition /mnt/boot
```
## Install Essential Packages
```sh
pacstrap -K /mnt base base-devel linux linux-firmware neovim networkmanager network-manager-applet grub efibootmgr linux-headers mtools git xdg-user-dirs
```
## Configure the Systems
```sh
genfstab -U /mnt >> /mnt/etc/fstab
```
## Chroot
```sh
arch-chroot /mnt
```
## Time Zone
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
## Network Configuration 
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
Enable Network Manager
```sh
systemctl enable NetworkManager
```
## Install GRUB
```sh
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```
## Set the root Password
```sh
passwd
```
## Create a New User
```sh
useradd -m -G wheel yourUsername
passwd yourUsername  
export EDITOR=nvim
```
Edit `/etc/sudoers` run “visudo” and uncomment the following line:
```sh
## Uncomment to allow members of group wheel to execute any command
%wheel ALL=(ALL) ALL
```
## Exit, Umount, and Reboot
```sh
exit
umount -a
reboot  
```

# DWM Installation
Soon
