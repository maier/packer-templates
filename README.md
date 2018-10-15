# Packer Templates

[Packer](https://packer.io) templates, mainly for use building boxes for [Vagrant Cloud](https://vagrantcloud.com/maier/).

### Environment

Latest versions of: [packer](https://www.packer.io), [vagrant](https://www.vagrantup.com), and [VirtualBox](https://www.virtualbox.org)

### Current boxes

* [Alpine 3.7 x86_64](https://app.vagrantup.com/maier/boxes/alpine-3.7-x86_64)
* [CentOS 7.5.1804 x86_64](https://app.vagrantup.com/maier/boxes/centos-7.5.1804-x86_64)
* [Debian 9.1.0 x86_64](https://app.vagrantup.com/maier/boxes/debian-9.1.0-x86_64)
* [Ubuntu 18.04 x86_64](https://app.vagrantup.com/maier/boxes/ubuntu-18.04-x86_64)
* [OmniOS r151014](https://app.vagrantup.com/maier/boxes/omnios-r151014-x86_64)

## Use existing template

Using `centos7.5.1804` as an example:

1. `cd centos7.5.1804`
1. Edit `centos-7.5.1804-x86_64.json`
	1. Update `push.name` to use the correct account name.
	1. And anything else that interests you (customize by editing anything applicable in the `scripts/` or `http/` subdirectories.)

To perform a local build simply run, `../build.sh local`

To perform the build integrated with Vagrant Cloud run, `../build.sh vagrantcloud` (Ensure that `VAGRANTCLOUD_USER` and `VAGRANTCLOUD_TOKEN` are set correctly.)

#### Test build

Note, this is a **local** build and will **intentionally** fail on the *vagrant-cloud post-processor*. If it didn't it would push every build up to Vagrant Cloud, probably not what is desired when the template is being developed, updated, and/or tested.

```
$ ../build.sh local
```

> Note, to debug the VM boot process change *headless* to *false* in the template. Optionally, run `PACKER_LOG=1 packer build centos-7.5.1804-x86_64.json` to see additional debugging output from Packer.

#### Deploy to Vagrant Cloud

This will act accordingly to how the variables were set in the environment and `build.conf`.

```
$ ../build.sh vagrantcloud
```

## Creating a new distribution/release template

1. Create distribution specific directory structure by copying a previous release or a similar distribution. `$ mkdir centos7.x.y && cp -r centos7.5.1804/* centos7.x.7/.`
1. Change to the new directory `$ cd centos7.x.7`
1. Change the name of the packer configuration file `mv centos-7.5.1804-x86_64.json centos-7.x.7-x86_64.json`
1. Edit the new packer configuration file for the new distro/release
1. Edit remaining files to update for new distro/release

Note: some of the older release templates still reference the previous Atlas configurations; to build those again the template files would need to be updated to use Vagrant Cloud rather than Atlas.
