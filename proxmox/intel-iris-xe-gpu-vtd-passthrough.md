# Intel Iris XE GPU VT-d passthrough on Proxmox 8 for Windows 11 and Debian 12

This guide is based on Derek Seaman's [great article](https://www.derekseaman.com/2023/06/proxmox-ve-8-windows-11-vgpu-vt-d-passthrough-with-intel-alder-lake.html). It improves somewhat on the Windows 11 installation and it provides instructions for a Debian 12 virtual machine.

Tested on 12th and 13th generation Intel CPUs, should work on 11th gen too, as they support [VT-d](https://en.wikipedia.org/wiki/X86_virtualization#Intel-VT-d).

VT-d allows one GPU to be shared by multiple virtual machines on the same Proxmox host by using so called virtual functions (VF). 

## Proxmox VE 8 Host Setup

First we need to install the Intel i915 graphics drivers for linux with SR-IOV support. These can be found here: https://github.com/strongtz/i915-sriov-dkms

Before starting, make sure you updated the system.  

1. Clone the repo:

```Bash
apt install git
mkdir repo
cd repo
git clone https://github.com/strongtz/i915-sriov-dkms.git
cd i915-sriov-dkms/
```

2. Edit the `dkms.conf` file:

```Bash
nano dkms.conf
```

3. Delete the first two lines of the file and then paste in the two lines below. Save and exit Nano (Ctrl-O then Ctrl-X).

```Bash
PACKAGE_NAME="i915-sriov-dkms"
PACKAGE_VERSION="6.1"
```

4. Move the repository to the `/usr/src` folder:

```Bash
cd ..
mv i915-sriov-dkms/ /usr/src/i915-sriov-dkms-6.1
```

5. Install kernel headers:

```Bash
apt install pve-headers-$(uname -r)
```

6. Install and build DKMS:

```Bash
apt install dkms build-* unzip -y
dkms install --force -m i915-sriov-dkms -v 6.1
```

7. Check DKMS is installed:

```Bash
dkms status
```
Output should contain `i915-sriov-dkms/6.1`


## Windows 11 VM Setup
## Debian 12 VM Setup
