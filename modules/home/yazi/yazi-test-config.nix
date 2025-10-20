{
  yazi,
  pkgs,
  ...
}:

{
  programs.yazi = {
    enable = true;
    # package = yazi.packages.${pkgs.system}.default;
    package = pkgs.yazi;
    settings = {
      opener = {
        notify-send = [
          {
            run = ''notify-send $@'';
            desc = "notify-send";
          }
        ];
      };
      open.append_rules = [
        {
          name = "*/";
          use = "notify-send";
        }
        {
          name = "*";
          use = "notify-send";
        }
        # {
        #   mime = "*";
        #   use = "notify-send";
        # }
      ];
    };
  };
}
