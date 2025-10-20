{
  pkgs,
  ...
}:
let

  open-with-cmd-yazi = pkgs.stdenv.mkDerivation {
    pname = "open-with-cmd.yazi";
    version = "latest";

    src = pkgs.fetchFromGitHub {
      owner = "Ape";
      repo = "open-with-cmd.yazi";
      rev = "433cf301c36882c31032d3280ab0c94825fc5e9f";
      hash = "sha256-QazKfNEPFdkHwMrH4D+VMwj8fGXM8KHDdSvm1tik3dQ=";
    };

    installPhase = ''
      mkdir -p $out
      cp -r $src/* $out/
    '';
  };
in
{
  programs.yazi = {
    plugins = {
      open-with-cmd-yazi = open-with-cmd-yazi;
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          on = "o";
          run = "plugin open-with-cmd --args=block";
          desc = "Open with command in the terminal";
        }
        {
          on = "O";
          run = "plugin open-with-cmd";
          desc = "Open with command";
        }
      ];
    };
  };
}
