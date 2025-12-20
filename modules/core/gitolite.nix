{ inputs, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.gitolite ];
  services.gitolite = {
    # enable = true;
    adminPubkey = "${inputs.secrets}/.ssh/gitolite.pub";
    enableGitAnnex = true;
  };
}
