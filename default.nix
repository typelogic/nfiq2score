with import <nixpkgs> {}; {
  qpidEnv = stdenvNoCC.mkDerivation {
    name = "my-gcc6-environment";
    buildInputs = [
        gcc6
        cmake_2_8
    ];
  };
}
