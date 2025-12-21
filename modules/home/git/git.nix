{ pkgs, username, ... }:
{
  # git aliases are placed in .zshrc in chezmoi repo
  programs.git = {
    enable = true;

    signing = {
      key = "0FA54B4EDF6CE0E9";
      signByDefault = true;
    };
    settings = {
      user = {
        name = "coglinks";
        email = "103402972+coglinks@users.noreply.github.com";
      };
      init.defaultBranch = "main";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      pull.ff = "only";
      color.ui = true;
      core.excludesFile = "/home/${username}/.config/git/.gitignore";

      credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";

      aliases = {
        apply-gitignore = "!git ls-files -ci --exclude-standard -z | xargs -0 git rm --cached";
      };
    };
  };

  home.packages = with pkgs; [
    keychain
    git-annex
    git-crypt
    git-remote-gcrypt
    gh
  ];
}
