{
  inputs = {
    # Track a specific tag on the nixpkgs repo.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # The flake format itself is very minimal, so the use of this
    # library is common.
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:

    # For every platform that Nix supports, we ...
    flake-utils.lib.eachDefaultSystem (system:

      let pkgs = import nixpkgs { inherit system; };
      in 
      {

        devShells.default =

          pkgs.mkShellNoCC {
            name = "rules_nixpkgs_shell";

            packages = with pkgs; [ 
              bazel_7 
              bazel-buildtools 
              cacert 
              nix 
              git 

              llvmPackages_20.clang-tools
              python312
              coreutils-full
            ];
          };
      });
}