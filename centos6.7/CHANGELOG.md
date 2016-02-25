## [CentOS](http://centos.org) v6.7 

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

vagrant init maier/centos-6.7-x86_64

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

* v1.0.0
   * initial

