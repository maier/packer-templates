## [Debian](http://debian.org) v9.1 (stretch)

* x86_64
* base install
* has VBoxGuestAdditions
* [Packer template](https://github.com/maier/packer-templates/)

## Use

```
#
# Create initial Vagrantfile
#

vagrant init maier/debian-9.1.0-x86_64

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

* v9.1.0
    * initial 9.1 (stretch)
