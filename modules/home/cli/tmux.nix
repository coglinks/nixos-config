{
  pkgs,
  fetchFromGithub,
  ...
}:

let
  aw-watcher-tmux = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "aw-watcher-tmux";
    version = "unstable-2025-09-28";
    src = fetchFromGithub {
      owner = "akohlbecker";
      repo = "aw-watcher-tmux";
      rev = "efaa7610add52bd2b39cd98d0e8e082b1e126487";
      hash = "sha256-L6YLyEOmb+vdz6bJdB0m5gONPpBp2fV3i9PiLSNrZNM=";
    };
  };
in
{
  programs.tmux = {
    enable = true;
    package = pkgs.tmux;
    plugins = with pkgs.tmuxPlugins; [
      resurrect
      continuum
      tmux-sessionx
    ];
    keyMode = "vi";
    newSession = false;
    extraConfig =
      # bash
      ''
        #- [t] - NOTE: Tools

        bind "t" switch-client -T "TOOLS" \; display-message "TOOLS: [g]-Lazygit"
        bind -T "TOOLS" "g" display-popup -w "100%" -h "100%" -d "#{pane_current_path}" -E "lazygit"

        # NOTE: Preferences

        set -g mouse on

        # image.nvim setup

        set -gq allow-passthrough on
        set -g visual-activity off

        ## plugin setups

        set -g @sessionx-bind 'o'
        set -g @plugin 'akohlbecker/aw-watcher-tmux'

        # nvim: `escape-time` (500) is higher than 300ms
        set-option -sg escape-time 10

        # nvim: focus-events` is not enabled. |'autoread'| may not work.
        set-option -g focus-events on


        # nvim: $TERM should be "screen-256color" or "tmux-256color" in tmux. Colors might look wrong.
        set-option -g default-terminal "screen-256color"

        run '~/.tmux/plugins/tpm/tpm'
      '';
  };
}
