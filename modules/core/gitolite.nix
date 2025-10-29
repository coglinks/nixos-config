{ inputs, ... }:

{
  services.gitolite = {
    enable = true;
    adminPubkey = "SHA256:wy9wjAa06+AySFmduIxgDXPsvAQP45GFsjX3EuK9zNs incogshift@laptop";
    enableGitAnnex = true;
  };
}
