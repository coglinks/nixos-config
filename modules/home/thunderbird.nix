{ pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
  ];
  # programs.thunderbird = {
  #   enable = true;
  #   profiles."incogshift" = {
  #     search.force = true;
  #     search.default = "ddg";
  #   };
  # };
}
