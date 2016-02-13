# [Alpine Linux](http://alpinelinux.org)

* minimal linux distro
* good for Docker containers [gliderlabs/docker-alpine](https://github.com/gliderlabs/docker-alpine)

Build is for developing and testing what will be run in a container and building Dockerfiles.

* v3.3.1 `vagrant init maier/alpine-3.3.1-x86_64`

## Usage notes

Virtualbox Guest Additions do not build/install on v3.3.1 of Alpine.

* private network needs be configured as static in Vagrantfile in order to use folder sharing. If it is set to DHCP, Virtualbox will not see the address assigned to the interface, therefore, Vagrant will not be able to retrieve it to configure NFS.
* folder sharing should be configured to use NFS in Vagrantfile.
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
Packer v0.8.6
Vagrant 1.8.1
5.0.14r105127
```

