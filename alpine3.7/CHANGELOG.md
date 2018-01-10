## [Alpine Linux](http://alpinelinux.org) v3.7

* x86_64
* Standard install
* Includes VBoxGuestAdditions
* [Packer template](https://github.com/maier/packer-templates/alpine3.7)

## Use

#### Install the [vagrant-alpine](https://github.com/maier/vagrant-alpine) guest plugin.

```
vagrant plugin install vagrant-alpine
```

#### Create a `Vagrantfile`:

```
vagrant init maier/alpine-3.7-x86_64 --box-version 3.7.0
```

or

Make a copy of the example [Vagrantfile](https://github.com/maier/packer-templates/blob/master/alpine3.7/Vagrantfile) supplied with this repository.

#### Edit the Vagrantfile to customize for your needs.

#### Start the box:

```
vagrant up
```

## Changes

* v3.7.0
   * Initial -- Alpine v3.7.0
