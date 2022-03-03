# KVM Unit Tests Nix Flake

This repository contains a [Nix](https://nixos.org/download.html)
flake for the [KVM Unit
Tests](http://www.linux-kvm.org/page/KVM-unit-tests). This is useful
for hypervisor development.

To build the tests without checking out this repository with a
[Flake-enabled Nix](https://nixos.wiki/wiki/Flakes#Installing_flakes):

```sh
$ nix build github:blitz/nix-kvm-unit-tests
```

In a checkout of this repository, you can build it via:

```sh
$ nix build
```

You will find the KVM unit tests in
`result/share/kvm-unit-tests/`. Each file is a single test that can be
executed directly. You will need a qemu in your `PATH`.
