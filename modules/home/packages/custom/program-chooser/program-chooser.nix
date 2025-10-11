{ pkgs, ... }:
let
  program-chooser = pkgs.writeShellScriptBin "program-chooser" (
    builtins.readFile ./program-chooser.sh
  );
in
{
  home.packages = with pkgs; [
    program-chooser
  ];
}
