{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [ ripdrag ];
  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.system}.default;
    enableZshIntegration = true;
    enableBashIntegration = true;
    plugins = {
      sudo = pkgs.yaziPlugins.sudo;
    };
    shellWrapperName = "y";
    keymap = {
      mgr.prepend_keymap = [
        {
          on = "T";
          run = "shell --orphan --confirm kitty";
          desc = "Open terminal at current dir";
        }
        {
          on = "!";
          run = "shell \"\$SHELL\" --block";
          desc = "Open shell here";
        }
        {
          on = "<C-n>";
          run = ''shell 'ripdrag -a "$@" -x 2>/dev/null &' --confirm'';
        }
        {
          on = [
            "g"
            "s"
          ];
          run = "cd /inc";
          desc = "go to /inc";
        }
        {
          on = [
            "g"
            "r"
          ];
          run = "cd /inc/remotes";
          desc = "go to remotes";
        }
        {
          on = [
            "g"
            "t"
          ];
          run = "cd /inc/test";
          desc = "go to test dir";
        }
        {
          on = [
            "g"
            "e"
          ];
          run = "cd ~/nixos-config";
          desc = "go sys conf";
        }
        {
          on = [
            "g"
            "n"
          ];
          run = "cd /inc/notes/sems/sem3";
          desc = "go notes";
        }
        {
          on = [
            "g"
            "N"
          ];
          run = "cd /inc/annex/notes-lfs";
          desc = "go notes-lfs";
        }
      ];
    };
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
        open-pdf = [
          {
            run = "zathura \"$@\" &";
            desc = "Open PDF";
            orphan = true;
            block = false;
            for = "unix";
          }
        ];
        program-chooser = [
          {
            run = "program-chooser \"$@\"";
            desc = "program-chooser";
            orphan = true;
            block = false;
            for = "unix";
          }
        ];
      };
      open.append_rules = [
        {
          mime = "*";
          use = "program-chooser";
        }
      ];
      open.prepend_rules = [
        {
          url = "*.pdf";
          use = "open-pdf";
        }
      ];

    };
  };
}
