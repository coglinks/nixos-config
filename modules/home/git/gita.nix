{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [ gita ];

  programs.zsh.completionInit =
    lib.mkOrder 1500
      #bash
      ''
        # gita auto-completion setup
        autoload -U +X bashcompinit && bashcompinit
        source ${
          pkgs.fetchFromGitHub {
            owner = "nosarthur";
            repo = "gita";
            rev = "d3274c54f4fc000329572f06ffc5abdc4e0472c2";
            hash = "sha256-+WQYU4DhwSKDhWnByVssBeVGeJM+AO0iapzHf6k+NQ0=";
          }
          + "/auto-completion/bash/.gita-completion.bash"
        }
      '';
}
