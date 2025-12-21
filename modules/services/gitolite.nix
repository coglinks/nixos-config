{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:

{
  options.consuetudo.programs.gitolite = {
    enable = lib.mkEnableOption "Gitolite setup";
  };

  config = lib.mkIf config.consuetudo.programs.gitolite.enable {
    environment.systemPackages = [ pkgs.gitolite ];
    services.gitolite = {
      enable = false;
      adminPubkey = "${inputs.secrets}/.ssh/gitolite.pub";
      enableGitAnnex = true;
    };
  };
}
