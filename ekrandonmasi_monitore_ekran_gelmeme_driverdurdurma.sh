#/bin/bash

#inxi -G

##amd için
#DRIVER="amdgpu.dc=0"
##i915 için   
#DRIVER="i915.enable_psr=0"

sudo sed -i -e 's|GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"|GRUB_CMDLINE_LINUX_DEFAULT="quiet splash $DRIVER|' /etc/default/grub