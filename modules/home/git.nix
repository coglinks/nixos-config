{ pkgs, username, ... }:
{
  programs.git = {
    enable = true;

    userName = "incogshift";
    userEmail = "incog267@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      pull.ff = "only";
      color.ui = true;
      core.excludesFile = "/home/${username}/.config/git/.gitignore";

      credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
    };

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = false;
        diff-so-fancy = true;
        navigate = true;
      };
    };

    lfs.enable = true;

    aliases = {
      apply-gitignore = "!git ls-files -ci --exclude-standard -z | xargs -0 git rm --cached";
    };
  };

  home.packages = with pkgs; [
    git-annex
    git-crypt
    gh
  ];

  programs.zsh.shellAliases = {
    g = "lazygit";
    gf = "onefetch --number-of-file-churns 0 --no-color-palette";
    ga = "git add";
    gaa = "git add --all";
    gs = "git status";
    gb = "git branch";
    gm = "git merge";
    gd = "git diff";
    gpl = "git pull";
    gplo = "git pull origin";
    gps = "git push";
    gpso = "git push origin";
    gpst = "git push --follow-tags";
    gcl = "git clone";
    gc = "git commit";
    gcm = "git commit -m";
    gcma = "git add --all && git commit -m";
    gtag = "git tag -ma";
    gch = "git checkout";
    gchb = "git checkout -b";
    glog = "git log --oneline --decorate --graph";
    glol = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'";
    glola = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all";
    glols = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat";
  };
}
