{ pkgs, ... }:

{
  programs.yazi = {
    plugins = { lazygit = pkgs.yaziPlugins.lazygit; };
    keymap = {
      mgr.prepend_keymap = [
        {
          on   = [ "g" "i" ];
          run  = "plugin lazygit";
          desc = "run lazygit";
        }
      ];
    };
  };
}
