## [Alpine Linux](http://alpinelinux.org) v3.3

* x86_64
* base install
* no VBoxGuestAdditions
* [Packer template](https://github.com/maier/packer-templates/)

## Use

#### Install the [vagrant-alpine](https://github.com/maier/vagrant-alpine) guest plugin.

```
vagrant plugin install vagrant-alpine
```

#### Create a `Vagrantfile`:

```
vagrant init maier/alpine-3.3-x86_64
```

#### Edit the Vagrantfile to customize for your needs.

* Networking (Until VBGA support)
   * Add a static private network interface to use shared folders.
      * e.g. `alpine.vm.network "private_network", ip: "192.168.200.10"`
* Shared folders (Until VBGA support)
   * Disable default share if not using shared folders so Vagrant will not block attempting to mount the volume.
      * `config.vm.synced_folder '.', '/vagrant', disabled: true`
   * Enable synced folders with `type: 'nfs'`, **requires** static address on private network interface to function.

#### Start the box:

```
vagrant up
```

## Changes

* v1.3.0
   * Initial -- Alpine v3.3.3


> Note: Moving to point releases as patch level releases will self-upgrade during build. e.g. Alpine v3.3.1 iso used to build box but, v3.3.3 is actually available in the v3.3 repository. Running `apk -U upgrade` during provisioning will take the v3.3.1 image just built to Alpine v3.3.3. The box images will be based on the primary Alpine release e.g. v3.3 and the version of the box will reflect the patch level e.g. Alpine v3.3.**3** = box version v1.**3**.0. Changes to the packer building template/provisioning will be reflected at the box patch level e.g. change to a provisioning script would result in v1.3.**1** etc.
