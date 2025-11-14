{ ... }:

{
  environment.pathsToLink = [
    "/share/zsh"
    "/share/bash-completion"
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
}
