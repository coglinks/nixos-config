{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    plugins = {
      sudo = pkgs.yaziPlugins.sudo;
    };
    shellWrapperName = "y";
    settings = {
      mgr.show_hidden = true;
      opener = {
        edit = [
          {
            run = "tmux new-window \${EDITOR:-vi} \"\$@\"";
            desc = "$EDITOR";
            block = true;
            for = "unix";
          }
          {
            run = "code %*";
            orphan = true;
            desc = "code";
            for = "windows";
          }
          {
            run = "code -w %*";
            block = true;
            desc = "code (block)";
            for = "windows";
          }
        ];

        edit-new = [
          {
            run = "kitty \${EDITOR:-vi} \"\$@\" &";
            desc = "kitty $EDITOR";
            block = true;
            for = "unix";
          }
        ];
      };

    };
  };
}
