{
  username,
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    btop-cuda
  ];

  /*
    Required for intel gpu monitoring. See:
    https://github.com/aristocratos/btop/blob/45a4da8639f8cec0ec6125b9163fdef1bc7522c6/Makefile#L336
  */
  security.wrappers.btop = {
    source = lib.getExe pkgs.btop-cuda;
    owner = "root";
    group = "root";
    capabilities = "cap_perfmon=+ep cap_dac_read_search=+ep";
  };

  home-manager.users.${username} = {
    programs.btop = {
      enable = true;
      package = null;

      settings = {
        # color_theme = "TTY";
        theme_background = false;
        update_ms = 500;
        rounded_corners = false;
      };
    };
  };
}
