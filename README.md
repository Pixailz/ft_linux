# FT_LINUX

## Some ressources

1. [The subject](rsc/en.subject.pdf)
1. [Linux From Scratch](https://www.linuxfromscratch.org/lfs/view/12.1/index.html)
1. [POSIX.1-2008](https://pubs.opengroup.org/onlinepubs/9699919799/)
1. [Filesystem Hierarchy Standard](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html)
1. [Linux Standard Base](https://refspecs.linuxfoundation.org/lsb.shtml)

1. [Beyond Linux From Scratch (systemd)](https://linuxfromscratch.org/blfs/view/12.1-systemd/)

## BookMark

1. Linux From Scratch 12.1
	> finished
2. Beyond Linux From Scratch
	> https://linuxfromscratch.org/blfs/view/12.1-systemd/postlfs/skel.html

## How To

### Run

```sh
sudo env TARGET_DISK=<target_disk> ./run
```

### Configure Package

A [package_meta_in](./package_meta_in) is here to specify:

1. A package id, associating:
	1. A repo type and link, to scrap latest link from
	1. A package prefix, helping scraping and construction output file name
	1. A package suffix, also helper scraping and construction output file name.
	some helping choosing a package version

When launching with this config in [run](./run)
```sh
declare -x	GET_PACK_SAVE=1
declare -x	GET_PACK_CHECK_REPO=1
```
the script will update the [package_meta_in](./package_meta_in) file

## TODO

1. Some test are not correctly checked and therefore considered as good
   1. Register check/test that don't pass
1. Split package compilation in three part: building, testing, installing
1. Finish systemd part, and do sysvinit, or do it will doing systemd

## IDEAS
1. Add support for more editor
1. SBU db already here, save in meta_in, and add update system
1. Don't redo all the package_meta each time, update var or add it
1. Add cli option
