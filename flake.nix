{
  description = "KVM Unit Tests";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
    kvm-unit-tests = {
      url = "gitlab:kvm-unit-tests/kvm-unit-tests/master";
      flake = false;
    };

    # For Hercules CI
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    flake-compat-ci.url = "github:hercules-ci/flake-compat-ci";
  };

  outputs = { self, nixpkgs, kvm-unit-tests, flake-compat, flake-compat-ci }: {
    packages.x86_64-linux.kvm-unit-tests = nixpkgs.legacyPackages.x86_64-linux.callPackage ./kvm-unit-tests.nix {
      src = kvm-unit-tests;
    };
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.kvm-unit-tests;

    # For Hercules CI, which doesn't natively support flakes (yet).
    ciNix = flake-compat-ci.lib.recurseIntoFlakeWith {
      flake = self;

      # Optional. Systems for which to perform CI.
      systems = [ "x86_64-linux" ];
    };

  };
}
