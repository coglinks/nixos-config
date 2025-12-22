{ pkgs, ... }:
let
  # This is a custom program. I chose the name tokei-all since this feels like another version tokei and I don't want to memorize more names ;-;
  tokei-all = pkgs.writeShellScriptBin "tokei-all" ''
    find . -name '*.?*' -type f | rev | cut -d. -f1 | rev  | tr '[:upper:]' '[:lower:]' | sort | uniq --count | sort -n
  '';
in
{
  home.packages = with pkgs; [
    tokei-all
  ];
}
