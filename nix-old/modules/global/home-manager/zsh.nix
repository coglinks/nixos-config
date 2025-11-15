{ pkgs-stable, lib, ... }:

{
  programs.zsh = {
    enable = true;
    package = pkgs-stable.zsh;
    history = {
      size = 10000;
      append = true;
    };
    initContent =
      let
        zshConfigEarlyInit = lib.mkOrder 500
          # zsh
          ''
            # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
            # Initialization code that may require console input (password prompts, [y/n]
            # confirmations, etc.) must go above this block; everything else may go below.
            if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
              source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
            fi
          '';
        zshConfig = lib.mkOrder 1000
          # zsh
          ''
            url() {
                local link="$1"
                local name="$2"
                local filepath="./''${name}.url"

                echo "[InternetShortcut]
            URL=''${link}" > "$filepath"

                chmod +x "$filepath"
                echo "Shortcut created: $filepath"
            }
            export PATH="$HOME/.config/nixCats-nvim/result/bin:$PATH"
          '';
        zshConfigLateInit = lib.mkOrder 1500
          # zsh
          ''
            # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
            [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
          '';
      in
      lib.mkMerge [
        zshConfigEarlyInit
        zshConfig
        zshConfigLateInit
      ];
  };
}
