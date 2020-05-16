#!/bin/bash -x
## ~omadjoudj

sudo apt -y  install ecryptfs-utils cryptsetup vim vim-gtk3 virtualbox vagrant byobu build-essential gufw ufw \
             gnome-tweak-tool gnome-shell-extension-caffeine clamtk clamdscan git fonts-powerline xterm putty \
             calibre fonts-terminus xfonts-terminus sshuttle autossh i3 rofi ansible ansible-lint aria2 whois \
             qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager virtinst wireshark nmap \
             geoip-bin firetools firejail 


sudo apt remove nfs-kernel-server rpcbind

sudo snap install  keepassxc spotify vlc

for i in code zaproxy skype ; do
  sudo snap install --classic $i
done


## Cleaning up default install

sudo apt -y remove nfs-kernel-server rpcbind

##TODO: Maybe mask them as well

# If printing is not needed
sudo systemctl disable cups.socket cups.path cups.service
sudo systemctl kill --signal=SIGKILL cups.service
sudo systemctl stop cups.socket cups.path

# Disable Avahi 
sudo systemctl disable avahi-daemon.socket avahi-daemon.service
sudo systemctl stop avahi-daemon.socket avahi-daemon.service


# Enable the Firewall
sudo ufw enable
sudo ufw default deny incoming




## Vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
    
