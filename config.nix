{
    packageOverrides = pkgs: {
        cmake_2_8_8 = pkgs.cmake_2_8.overrideAttrs (oldAttrs: {
            name = "cmake-2.8.8";

            #patches = builtins.tail oldAttrs.patches; 
            patches = [];

            src = pkgs.fetchurl {
                url = "${oldAttrs.meta.homepage}/files/v2.8/cmake-2.8.8.tar.gz";
                #sha256 = pkgs.lib.fakeSha256;
                sha256 = "0ihbayvxgd4ckj4hy74ai42f1549mi6cdsm81br0y8nnciw8jn9b";
            };
        });

    };
}
