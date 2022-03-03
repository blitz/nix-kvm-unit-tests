{
  description = "KVM Unit Tests";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
    kvm-unit-tests = {
      url = "gitlab:kvm-unit-tests/kvm-unit-tests/master";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, kvm-unit-tests }: {
    packages.x86_64-linux.kvm-unit-tests = nixpkgs.legacyPackages.x86_64-linux.callPackage ./kvm-unit-tests.nix {
      src = kvm-unit-tests;
    };
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.kvm-unit-tests;
  };
}
