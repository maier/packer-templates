## [CentOS](http://centos.org) v6.6

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

vagrant init maier/centos-6.6-x86_64

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

* v1.1.0
   * move to vault repos
* v1.0.2
   * build process cleanup
* v1.0.1
   * add `%end` to `%package` and `%post` sections in kickstart config
* v1.0.0
   * initial

