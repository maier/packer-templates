## [Alpine Linux](http://alpinelinux.org) v3.1.3

* x86_64
* base install
* no VBoxGuestAdditions

## Use

Install the [vagrant-alpine](https://github.com/maier/vagrant-alpine) guest plugin.

```
vagrant plugin install vagrant-alpine
```

Create a `Vagrantfile`:

```
vagrant init maier/alpine-3.1.3-x86_64
```

Edit the Vagrantfile to customize for your needs.

* Networking (Until VBGA support)
   * Add a static private network interface to use shared folders.
      * e.g. `alpine.vm.network "private_network", ip: "192.168.200.10"`
* Shared folders (Until VBGA support)
   * Disable default share if not using shared folders so Vagrant will not block attempting to mount the volume.
      * `config.vm.synced_folder '.', '/vagrant', disabled: true`
   * Enable synced folders with `type: 'nfs'`, **requires** static address on private network interface to function.


Start the box:

```
vagrant up
```

## Changes

* v1.2.0
   * Remove items supported by vagrant-alpine plugin (nfs, fake
   shutdown).
   * Add displaying output of apk add attempts in apk-install wrapper.
   * Migrate bash and curl install to vagrant script.
   * Remove progress display from key retrieval in vagrant script.
   * Update sudoers script to use apk-install wrapper.
* v1.1.0
   * Add `/usr/local/sbin/apk-install` to compensate for canonical `apk` failing without setting an exit code.
   * Add installation of `bash` and `nfs-utils` to base to support Vagrant.
* v1.0.0
   * Initial
* v0.0.1
   * Build and altas testing
