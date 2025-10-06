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

      annex = {
        gitaddtoannex = true;
      };

      filter."annex" = {
        smudge = "git-annex smudge -- %f";
        clean = "git-annex smudge --clean -- %f";
        process = "git-annex filter-process";
      };
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

    attributes = [
      "*.png filter=lfs diff=lfs merge=lfs -text"
      "*.jpg filter=lfs diff=lfs merge=lfs -text"
      "*.jpeg filter=lfs diff=lfs merge=lfs -text"

      "* annex.largefiles=nothing"
      "*.pdf filter=annex annex.largefiles=anything"
      "*.doc filter=annex annex.largefiles=anything"
      "*.docx filter=annex annex.largefiles=anything"
      "*.xls filter=annex annex.largefiles=anything"
      "*.xlsx filter=annex annex.largefiles=anything"
      "*.ppt filter=annex annex.largefiles=anything"
      "*.pptx filter=annex annex.largefiles=anything"
      "*.odt filter=annex annex.largefiles=anything"
      "*.ods filter=annex annex.largefiles=anything"
      "*.odp filter=annex annex.largefiles=anything"
      "*.jpg filter=annex annex.largefiles=largerthan=200kb"
      "*.jpeg filter=annex annex.largefiles=largerthan=200kb"
      "*.png filter=annex annex.largefiles=largerthan=200kb"
      "*.gif filter=annex annex.largefiles=anything"
      "*.bmp filter=annex annex.largefiles=anything"
      "*.tif filter=annex annex.largefiles=anything"
      "*.tiff filter=annex annex.largefiles=anything"
      "*.webp filter=annex annex.largefiles=anything"
      "*.heic filter=annex annex.largefiles=anything"
      "*.ico filter=annex annex.largefiles=anything"
      "*.psd filter=annex annex.largefiles=anything"
      "*.mp3 filter=annex annex.largefiles=anything"
      "*.wav filter=annex annex.largefiles=anything"
      "*.flac filter=annex annex.largefiles=anything"
      "*.aac filter=annex annex.largefiles=anything"
      "*.ogg filter=annex annex.largefiles=anything"
      "*.m4a filter=annex annex.largefiles=anything"
      "*.wma filter=annex annex.largefiles=anything"
      "*.mp4 filter=annex annex.largefiles=anything"
      "*.mkv filter=annex annex.largefiles=anything"
      "*.avi filter=annex annex.largefiles=anything"
      "*.mov filter=annex annex.largefiles=anything"
      "*.flv filter=annex annex.largefiles=anything"
      "*.webm filter=annex annex.largefiles=anything"
      "*.mpg filter=annex annex.largefiles=anything"
      "*.mpeg filter=annex annex.largefiles=anything"
      "*.wmv filter=annex annex.largefiles=anything"
      "*.zip filter=annex annex.largefiles=anything"
      "*.rar filter=annex annex.largefiles=anything"
      "*.7z filter=annex annex.largefiles=anything"
      "*.tar filter=annex annex.largefiles=anything"
      "*.gz filter=annex annex.largefiles=anything"
      "*.bz2 filter=annex annex.largefiles=anything"
      "*.xz filter=annex annex.largefiles=anything"
      "*.iso filter=annex annex.largefiles=anything"
      "*.exe filter=annex annex.largefiles=anything"
      "*.dll filter=annex annex.largefiles=anything"
      "*.so filter=annex annex.largefiles=anything"
      "*.dylib filter=annex annex.largefiles=anything"
      "*.out filter=annex annex.largefiles=anything"
      "*.bin filter=annex annex.largefiles=anything"
      "*.app filter=annex annex.largefiles=anything"
      "*.ttf filter=annex annex.largefiles=anything"
      "*.otf filter=annex annex.largefiles=anything"
      "*.fnt filter=annex annex.largefiles=anything"
      "*.swf filter=annex annex.largefiles=anything"
      "*.dat filter=annex annex.largefiles=anything"
    ];

    aliases = {
      apply-gitignore = "!git ls-files -ci --exclude-standard -z | xargs -0 git rm --cached";
    };
  };

  home.packages = with pkgs; [
    git-annex
    git-crypt
    gh
  ];

  xdg.configFile."git/.gitignore".text = ''
    .vscode
  '';

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
