{ stdenv
, lib
, getopt

# Needs to be specified by the caller.
, src }:
stdenv.mkDerivation {
  name = "kvm-unit-tests";

  inherit src;

  hardeningDisable = [ "all" ];
  enableParallelBuilding = true;

  nativeBuildInputs = [
    getopt
  ];
  
  postPatch = ''
    patchShebangs configure
    patchShebangs scripts/mkstandalone.sh
  '';

  meta = with lib; {
    description = "A set of unit tests for KVM";
    homepage    = "http://www.linux-kvm.org/page/KVM-unit-tests";
    license     = licenses.gpl2;
    platforms   = [ "x86_64-linux" ];
    maintainers = with maintainers; [ blitz ];
  };
}
