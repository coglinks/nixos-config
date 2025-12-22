{ username, ... }:

{
  home-manager.users.${username} = {
    programs.zathura = {
      enable = true;
      options = {
        selection-clipboard = "clipboard";
        recolor = true;
      };
    };
  };
}
