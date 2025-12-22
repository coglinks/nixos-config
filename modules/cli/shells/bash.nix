{ ... }:

{
  environment.pathsToLink = [
    "/share/bash-completion"
  ];

  programs.bash = {
    enable = true;
    completion.enable = true;
  };
}
