## [CentOS](http://centos.org) v7.1.1503

* x86_64
* base install
* has VBoxGuestAdditions
* epel, gcc, kernel-devel, and perl added (with their respective deps)
* [Packer template](https://github.com/maier/packer-templates/)

## Use

```
#
# Create initial Vagrantfile
#

vagrant init maier/centos-7.1.1503-x86_64

#
# Customize
#

vi Vagrantfile

#
# Start the box
#

vagrant up
```


## Changes

* v1.2.0
    * switch to vault for ISO and yum repositories (otherwise system is auto-upgraded to 7.2)
* v1.1.3
    * increase memory to 1024, add removal of packages installed to build VirtualBox Guest Additions to leave min os state clean.
* v1.1.2
    * virtualbox v5.0.10r104061 guest additions 
* v1.1.1
    * build process cleanup
* v1.1.0
    * atlas virtualbox version 4.3.10 guest additions do not install well on centos 7. box built with updated virtual box 4.3.26 and uploaded.
* v1.0.1
    * initial build, bump version to avoid atlas build collision
* v1.0.0
    * mistaken push...
