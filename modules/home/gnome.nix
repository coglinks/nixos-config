{ pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      evince # pdf
      file-roller # archive
      gnome-text-editor # gedit
    ]
  );
}
