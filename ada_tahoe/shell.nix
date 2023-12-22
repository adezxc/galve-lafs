{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
   nativeBuildInputs = [
     pkgs.buildPackages.gnat
     # or some other version you need, sticking to the default is
     # probably wise to match the libraries in nixpkgs
     pkgs.buildPackages.gprbuild
     pkgs.buildPackages.alire
   ];

   # for a shell just buildInputs is also fine
   propagatedBuildInputs = [
     # Libraries go here, e.g.
     pkgs.buildPackages.gnat
     # or some other version you need, sticking to the default is
     # probably wise to match the libraries in nixpkgs
     pkgs.buildPackages.gprbuild
     pkgs.buildPackages.alire
     pkgs.gnatcoll-core
     pkgs.gnatcoll-gmp
   ];
}
