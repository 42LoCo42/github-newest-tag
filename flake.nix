{
  outputs = { flake-utils, nixpkgs, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; }; in rec {
        packages.default = pkgs.buildGoModule {
          pname = "github-newest-tag";
          version = "0";
          src = ./.;
          vendorHash = "";
        };

        devShells.default = pkgs.mkShell {
          inputsFrom = [ packages.default ];
        };
      });
}
