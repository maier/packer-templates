## [CentOS](http://centos.org) v7.2.1511

* x86_64
* minimal install
* has VBoxGuestAdditions
* [Packer template](https://github.com/maier/packer-templates/)

## Use

```
#
# Create initial Vagrantfile
#

vagrant init maier/centos-7.2.1511-x86_64

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
* v1.1.0
   * VBGA 5.1.10 
