{ inputs, ... }:

{
  services.davfs2.enable = true;

  environment.etc."davfs2/secrets" = {
    source = "${inputs.secrets}/passwords/nextcloud/mount";
  };
}
