{ pkgs, pkgs-custom, ... }:

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

        # Conda integration
        use ${pkgs.nu_scripts}/share/nu_scripts/modules/virtual_environments/nu_conda/nu_conda.nu
        $env.nu_conda = '${pkgs.nu_scripts}/share/nu_scripts/modules/virtual_environments/nu_conda/nu_conda.nu'

        # Plugins
        overlay use ${pkgs-custom.alias-finder-nu}/share/alias-finder/alias-finder.nu

        def ll [] { ls -l | select name mode user group size modified}
        def l [] { ls -al | select name mode user group size modified}

        def --env mkcd [folder: path] {
          mkdir $folder
          cd $folder
        }

        def "nt" [ ] {

        def --env y [...args] {
          let tmp = (mktemp -t "yazi-cwd.XXXXXX")
          ^yazi ...$args --cwd-file $tmp
          let cwd = (open $tmp)
          if $cwd != "" and $cwd != $env.PWD {
            cd $cwd
          }
          rm -fp $tmp
        }

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

        def nufzf [] {
          $in | each {|i| $i | to json --raw}
              | str join "\n"
              | fzf -m
              | lines
              | each {$in | from json}
              | reduce {|it, acc| $acc | append $it }
        }

        $env.Path = ($env.Path
          | append [
            '~/.local/bin',
            '~/.config/nixCats-nvim/result/bin',
            '~/.cargo/bin'
          ]
        )
      '';
    environmentVariables = {
      EDITOR = "nvim";
      config.buffer_editor = "nvim";
      config.edit_mode = "vi";
      config.show_banner = false;
    };
  };
}
