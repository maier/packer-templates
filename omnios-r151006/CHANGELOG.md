## [OmniOS](http://omnios.omniti.com)

* x86_64
* base install
* has VBoxGuestAdditions
* [Packer template](https://github.com/maier/packer-templates/)

## Use

```
#
# Create initial Vagrantfile
#

vagrant init maier/omnios-r151006-x86_64

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
    * initial r151006
