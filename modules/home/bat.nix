{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
    };
    extraPackages = with pkgs.bat-extras; [
      batman
      batpipe
<<<<<<< HEAD
      batgrep
      batdiff
||||||| 7b9b95fa
      batgrep
      # batdiff
=======
      # batgrep
      # batdiff
>>>>>>> refs/remotes/foundation/main
    ];
  };
}
