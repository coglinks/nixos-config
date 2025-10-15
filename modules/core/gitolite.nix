{ ... }:

{
  services.gitolite = {
    enable = true;
    adminPubkey = builtins.readFile ./gitolite-crypt.pub;
    enableGitAnnex = true;
  };
}
