## [OmniOS](http://omnios.omniti.com)

* Basic OS

Build is for developing and testing

* r151014 `vagrant init maier/omnios-r151014-x86_64`

## Usage notes

Includes:

* VBGA 5.1.12
* gcc 4.8.1
* go 1.7.4

## Build environment

```shell
⁖ packer version && vagrant -v && vboxmanage --version
Packer v0.12.1
Vagrant 1.9.1
5.1.12r112440
```

### To update base omnios image

Check for latest image at [http://omnios.omniti.com/media/](http://omnios.omniti.com/media/)

Download an image:

```
curl http://omnios.omniti.com/media/OmniOS_Text_r151014-Nov12.iso -O
```

Checksum image:
```
shasum -a 512 OmniOS_Text_r151014-Nov12.iso
```

Update packer json config with file url and checksum:

```
"iso_url": "file:./OmniOS_Text_r151014-Nov12.iso",
"iso_checksum": "...output from shasum command above...",
```
