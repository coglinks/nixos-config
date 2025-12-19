{ inputs, ... }:

{
  services.gitolite = {
    enable = true;
    adminPubkey = "${inputs.secrets}/.ssh/gitolite.pub";
    enableGitAnnex = true;
  };
}
