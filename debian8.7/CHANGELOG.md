## [Debian](http://debian.org) v8.7 (jessie)

* x86_64
* base install
* has VBoxGuestAdditions
* [Packer template](https://github.com/maier/packer-templates/)

## Use

```
#
# Create initial Vagrantfile
#

vagrant init maier/debian-8.7.0-x86_64

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

* v8.7.0
    * initial 8.7 (jessie)
