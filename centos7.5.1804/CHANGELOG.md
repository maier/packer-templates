## [CentOS](http://centos.org)

* x86_64
* base install
* has VBoxGuestAdditions
* [Packer template](https://github.com/maier/packer-templates/)

## Use

```
#
# Create initial Vagrantfile
#

vagrant init maier/centos-7.5.1804-x86_64

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
