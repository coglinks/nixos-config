{ username, inputs, ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
  };
}
