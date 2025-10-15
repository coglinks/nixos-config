{ ... }:

{
  service.gitolite = {
    enable = true;
    adminPubKey = builtins.readFile ./gitolite-crypt.pub;
    enableGitAnnex = true;
  };
}
