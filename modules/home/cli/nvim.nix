{ ... }:

{
  home = {
    sessionVariables = {
      EDITOR = "nvim";
    };
    sessionPath = [
      "$HOME/.config/nixCats-nvim/result/bin:$PATH"
    ];
  };
}
