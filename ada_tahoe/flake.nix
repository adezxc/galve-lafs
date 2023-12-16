{
 description = "A flake that includes alire, gprbuild, and gnat13";

 inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

 outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    packages.${system} = {
      alire = pkgs.alire;
      gprbuild = pkgs.gprbuild;
      gnat13 = pkgs.gnat13;
    };

    devShell.${system} = pkgs.mkShell {
      buildInputs = with pkgs; [
        alire
        gprbuild
        gnat13
      ];
    };
  };
}
