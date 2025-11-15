{ pkgs, ... }:
let
  program-chooser = pkgs.writeShellScriptBin "program-chooser" (
    builtins.readFile ./program-chooser.sh
  );
in
{
  home.packages = [
    program-chooser
  ];
}
