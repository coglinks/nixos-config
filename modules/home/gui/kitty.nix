{
  host,
  lib,
  username,
  ...
}:
{
  programs.kitty = {
    enable = true;

    font = {
      size = if (host == "laptop") then lib.mkForce 15 else lib.mkForce 16;
    };

    settings = {
      include = "~/.config/kitty/kitty-extra.conf";
      window_padding_width = if (host == "laptop") then 5 else 10;
    };
  };
  stylix.targets.kitty.enable = true;
}
