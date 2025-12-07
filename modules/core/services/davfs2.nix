# Adapted from https://blog.tiserbox.com/posts/2024-02-23-mounting-webdav-folder-in-nix-os.html
{ lib, inputs, ... }:

{
  services.davfs2.enable = true;

  # I don't need this anymore

  # environment.etc."davfs2/secrets" = {
  #   source = "${inputs.secrets}/passwords/nextcloud/mount";
  #   mode = "0600";
  # };

  # systemd.mounts = [
  #   {
  #     enable = true;
  #     description = "Webdav mount point";
  #     after = [ "network-online.target" ];
  #     wants = [ "network-online.target" ];
  #
  #     what = (
  #       lib.strings.removeSuffix "\n" (
  #         builtins.readFile "${inputs.secrets}/passwords/nextcloud/user1-webdav-url"
  #       )
  #     );
  #     where = "/mnt/nextcloud/user1";
  #     options = "uid=1000,gid=1000,file_mode=0664,dir_mode=2775";
  #     type = "davfs";
  #     mountConfig.TimeoutSec = 15;
  #   }
  # ];
}
