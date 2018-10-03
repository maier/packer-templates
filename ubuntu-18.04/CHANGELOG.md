## [Ubuntu](https://www.ubuntu.com) v18.04.1

* x86_64
* base install
* has VBoxGuestAdditions
* [Packer template](https://github.com/maier/packer-templates/)

## Use

```
#
# Create initial Vagrantfile
#

vagrant init maier/ubuntu-18.04-x86_64

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
    * initial
