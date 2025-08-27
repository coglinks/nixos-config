{ pkgs, ... }:

{
  programs.yazi = {
    plugins = { smart-enter = pkgs.yaziPlugins.smart-enter; };
    keymap = {
      mgr.prepend_keymap = [
        {
          on   = "l";
          run  = "plugin smart-enter";
          desc = "Enter the child directory, or open the file";
        }
      ];
    };
  };
}
