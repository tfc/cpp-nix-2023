{
  description = "C++ Development with Nix in 2023";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"
      ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        packages = {
          default = pkgs.callPackage ./package.nix { };
          clang = pkgs.callPackage ./package.nix { stdenv = pkgs.clangStdenv; };
        } // pkgs.lib.optionalAttrs (system != "x86_64-linux") {
          crossIntel = pkgs.pkgsCross.gnu64.callPackage ./package.nix {
            enableTests = false;
          };
        } // pkgs.lib.optionalAttrs (system != "aarch64-linux") {
          crossAarch64 = pkgs.pkgsCross.aarch64-multiplatform.callPackage ./package.nix {
            enableTests = false;
          };
        };

        checks = config.packages // {
          clang = config.packages.default.override {
            stdenv = pkgs.clangStdenv;
          };
        };
      };
    };
}
