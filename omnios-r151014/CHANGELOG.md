## [OmniOS](http://omnios.omniti.com)

* x86_64
* base install
* has VBoxGuestAdditions, gcc, golang
* [Packer template](https://github.com/maier/packer-templates/)

## Use

```
#
# Create initial Vagrantfile
#

vagrant init maier/omnios-r151014-x86_64

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
    * bring base to latest patches
* v1.1.0
    * bring base to latest patches
* v1.0.0
    * initial r151014
