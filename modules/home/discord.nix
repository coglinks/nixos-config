{ pkgs, ... }:
{
<<<<<<< HEAD
  home.packages = with pkgs; [
    discord
  ];
||||||| 7b9b95fa
  home.packages = with pkgs; [
    # discord
    # (discord.override {
    #  withVencord = true;
    # })
    webcord-vencord
  ];
=======
  home.packages = with pkgs; [ vesktop ];
>>>>>>> refs/remotes/foundation/main
}
