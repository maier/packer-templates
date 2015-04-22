# Packer Templates

[Packer](https://packer.io) templates, mainly for use building boxes for [Atlas](https://atlas.hashicorp.com/maier/).

### Current boxes

* [Alpine Linux](http://alpinelinux.org/) v3.1.3 x86_64 [Atlas boxes](https://atlas.hashicorp.com/maier/boxes/alpine-3.1.3-x86_64)
* [CentOS](http://centos.org/) v6.6 x86_64 [Atlas boxes](https://atlas.hashicorp.com/maier/boxes/centos-6.6-x86_64)
* [CentOS](http://centos.org/) v7.1.1503 x86_64 [Atlas boxes](https://atlas.hashicorp.com/maier/boxes/centos-7.1.1503-x86_64)


## Use existing template

Using `alpine3` as an example:

1. `cd alpine3`
2. Edit `alpine-3.1.3-x86_64.json`
	3. Update `push.name` to use the correct Atlas account name.
	4. And anything else that interests you
5. Edit `sh_vars`
	6. Set `ATLAS_USER_NAME` to the correct Atlas account name.

To perform a local build simply run, `packer build`

To perform the build integrated with Atlas run, `../atlas.sh`

#### Check syntax

```
$ packer validate alpine-3.1.3-x86_64.json
```

#### Test build

Note, this is a **local** build and will **intentionally** fail on the *atlas post-processor*. If it didn't it would push every build up to Atlas, probably not what is desired when the template is being developed, updated, and/or tested.

```
$ packer build alpine-3.1.3-x86_64.json
```

#### Deploy to Atlas

This will act accordingly to how the variables were set in `sh_vars`.

```
$ ../atlas.sh
```

> **NOTES**
>
> * When the build is created on Atlas some variables need to be set before it will work. Namely, the two `ATLAS_*` variables from `sh_vars` & `../atlas.sh`. The template is expecting these to be in the environment when Atlas performs the build. But, there is a chicken-and-egg issue with regards to, the template needs to be pushed to Atlas before the build variables can be edited... There does not currently appear to be a way to **create** a build without pushing a template first, which then triggers a build, which then fails... As such, the first build will probably fail until the `ATLAS_USER_NAME` and `ATLAS_BOX_NAME` variables are added in the Atlas Build Configuration Variables section.
> * CentOS 7 uses `build_type="local"`, builds the box locally then pushes the built box up to Atlas. (versus *alpine3* and *centos6* which leverage remote Atlas builds.) The reason for this is, the version of virtualbox used by Atlas is older and the vbga repeatedly failed to build/install on CentOS 7...YMMV. Building the box locally with virtualbox v4.3.26 works correctly [for me].

## Creating a new distribution/release template

1. Create distribution specific directory structure. e.g. `$ cp -r skel <New_Distro_or_Ver>`
1. Change to the directory
1. Edit `sh_vars` and set the required variables.
1. Run `../atlas.sh` once to generate a skeleton Packer template.
1. Edit the resulting template. Specific items which need to change are in `<<>>` (the `description` and `push.name` primarily.) Update the rest based on the needs of the distribution and the [Packer template documentation](https://www.packer.io/docs/templates/introduction.html). The `iso_url`, `iso_checksum`, and `boot_comand` would have to be set at the barest minimum. Add any additional builders or provisioners, etc.
1. Create any applicable artifacts in `http` and `scripts` to be used by the template.

#### Check syntax

```
$ packer validate <template>
```

#### Test build

Note, this is a **local** build and will **intentionally** fail on the *atlas post-processor*. If it didn't it would push every build up to Atlas, probably not what is desired when the template is being developed, updated, and/or tested.

```
$ packer build <template>
```

#### Deploy to Atlas

This will act accordingly to how the variables wer set in `sh_vars`.

```
$ ../atlas.sh
```
