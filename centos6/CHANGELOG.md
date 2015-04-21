## [CentOS](http://centos.org) v6.6

* x86_64
* base install
* has VBoxGuestAdditions
* epel, gcc, kernel-devel, and perl added (with their respective deps)

## Use

Create a `Vagrantfile`:

```
vagrant init maier/centos-6.6-x86_64
```

Edit the Vagrantfile to customize for your needs.

Start the box:

```
vagrant up
```

## Changes

* v1.0.2
   * build process cleanup
* v1.0.1
   * add `%end` to `%package` and `%post` sections in kickstart config
* v1.0.0
   * initial

