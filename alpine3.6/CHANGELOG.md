## [Alpine Linux](http://alpinelinux.org) v3.6

* x86_64
* Standard install
* Includes VBoxGuestAdditions
* [Packer template](https://github.com/maier/packer-templates/alpine3.6)

## Use

#### Install the [vagrant-alpine](https://github.com/maier/vagrant-alpine) guest plugin.

```
vagrant plugin install vagrant-alpine
```

#### Create a `Vagrantfile`:

```
vagrant init maier/alpine-3.6-x86_64 --box-version 3.6.2
```

or

Make a copy of the example [Vagrantfile](https://github.com/maier/packer-templates/blob/master/alpine3.6/Vagrantfile) supplied with this repository.

#### Edit the Vagrantfile to customize for your needs.

#### Start the box:

```
vagrant up
```

## Changes

* v3.6.2
    * Alpine v3.6.2
* v1.0.0
   * Initial -- Alpine v3.6.0
