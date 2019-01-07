## [Alpine Linux](http://alpinelinux.org) v3.8

* x86_64
* Standard install
* Includes VBoxGuestAdditions
* [Packer template](https://github.com/maier/packer-templates/alpine3.8)

## Use

#### Install the [vagrant-alpine](https://github.com/maier/vagrant-alpine) guest plugin.

```
vagrant plugin install vagrant-alpine
```

#### Create a `Vagrantfile`:

```
vagrant init maier/alpine-3.8-x86_64 --box-version 3.8.1
```

or

Make a copy of the example [Vagrantfile](https://github.com/maier/packer-templates/blob/master/alpine3.8/Vagrantfile) supplied with this repository.

#### Edit the Vagrantfile to customize for your needs.

#### Start the box:

```
vagrant up
```

## Changes

* v3.8.2
   * Updated to Alpine v3.8.2
   * Reduced image size by using "virt" installation media.

* v3.8.1
   * Initial -- Alpine v3.8.1
