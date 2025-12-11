{ pkgs, ... }:

{
  programs.nushell = {
    enable = true;
    plugins = with pkgs.nushellPlugins; [
      polars
      gstat
      desktop_notifications
      formats
      query
    ];
    extraConfig =
      let
        aliases =
          let
            alias = name: ''
              source ${pkgs.nu_scripts}/share/nu_scripts/aliases/${name}/${name}-aliases.nu
            '';
          in
          names: builtins.foldl' (prev: str: "${prev}\n${str}") "" (map alias names);

        completions =
          let
            completion = name: ''
              source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/${name}/${name}-completions.nu
            '';
          in
          names: builtins.foldl' (prev: str: "${prev}\n${str}") "" (map completion names);

        autogen-completions =
          let
            autogen = name: ''
              source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/auto-generate/completions/${name}.nu
            '';
          in
          names: builtins.foldl' (prev: str: "${prev}\n${str}") "" (map autogen names);
      in
      ''
        # nu_scripts aliases
        ${aliases [
          "git"
          "chezmoi"
        ]}

        # nu_scripts custom-completions
        ${completions [
          "git"
          "nix"
          "ssh"
          "bat"
          "man"
          "rg"
          "zoxide"
          "docker"
          "bitwarden-cli"
          "cargo"
          "tar"
          "gh"
          "glow"
          "bat"
        ]}

        ${autogen-completions [
          "nvim"
          "unzip"
          "zip"
          "xz"
          "wget"
          "dd"
          "rsync"
          "gzip"
        ]}

        source ~/.config/nushell/config-extra.nu

        def ll [] { ls -l | select name mode user group size modified}
        def l [] { ls -al | select name mode user group size modified}

        def --env mkcd [folder: path] {
          mkdir $folder
          cd $folder
        }

        def "nt" [ ] {

        notify-send --action 'y=Focus Window' test |
          if $in == "y" {
            hyprctl clients -j |
              from json |
              where workspace.id == 8 |
              where class == kitty |
              get title.0 |
              xargs -I{} hyprctl dispatch focuswindow "title:{}"
          }
        }
      '';
  };
}
