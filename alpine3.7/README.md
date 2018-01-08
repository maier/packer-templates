# [Alpine Linux](http://alpinelinux.org)

* minimal linux distro
* Includes Virtualbox Guest Additions (as of 3.6.2)
* good for developing for Alpine based Docker containers e.g. [gliderlabs/docker-alpine](https://github.com/gliderlabs/docker-alpine)

Build is for developing and testing what will be run in a container.

* v3.7 `vagrant init maier/alpine-3.7-x86_64`

## Usage notes

* `bash` is installed by default so `config.ssh.shell="/bin/sh"` is not necessary.
* Vagrant plugin `vagrant-alpine` developed to support Alpine specific guest.
   * `vagrant plugin install vagrant-alpine`.
   * [Github repository](https://github.com/maier/vagrant-alpine/).
   * Removed creation of fake `shutdown` command.
   * Remove installation of `nfs-utils`.
   * Remove starting `rpc.statd`.

## Build environment

```shell
⁖ packer version && vagrant -v && vboxmanage --version
Packer v1.1.0
Vagrant 2.0.0
5.1.28r117968
```
