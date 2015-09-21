# Description #

A number of packer templates for building vagrant boxes for different Linux distributions.

Many thanks to [digital-wonderland](https://github.com/digital-wonderland) for his [packer template](https://github.com/digital-wonderland/packer-templates)

# Requirements #

1. Latest version of packer
2. virtualbox or qemu. vmware-fusion support to come soon.
3. Fast internet connection!

# How to build your vagrant boxes #

In general use:

`packer build --only=<hypervisor> packer-opensuse13-1.json`

where <hypervisor> can be qemu or virtualbox-iso (vmware-fusion to be added soon).

If you omit --only it will try to build both in parallel which may not work as virtualbox and kvm doesn't play well while used simultaneously.

You can override a number of user defined variables using -var such as the md5 checksum of the source iso or whether to use in headless mode.

For example I have predownloaded the `openSUSE-NET-13.1` iso and call packer like:

```bash
packer build -var 'iso_url=openSUSE-13.1-NET-x86_64.iso' --only=virtualbox-iso packer-opensuse13.json
```

Or to disable headless mode:

```bash
packer build -var 'iso_url=openSUSE-13.1-NET-x86_64.iso' -var 'install_headless=false' --only=virtualbox-iso packer-opensuse13.json
```

# Output #

Can be found under `output/`

Add the box to your vagrant boxes like:

vagrant box add output/opensuse13.1-x86_64-virtualbox.box --name "opensuse13"
