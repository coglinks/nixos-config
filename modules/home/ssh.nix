{ username, inputs, ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      github = {
        host = "cog-github";
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_github";
        identitiesOnly = true;
        addKeysToAgent = "yes";
        controlMaster = "auto";
        controlPath = "~/.ssh/control-%r@%h:%p";
        controlPersist = "10m";
      };
      soft-serve = {
        host = "soft-serve";
        hostname = builtins.readFile "${inputs.secrets}/hosts/laptop";
        user = username;
        port = 23231;
        identityFile = "~/.ssh/${username}";
        identitiesOnly = true;
        addKeysToAgent = "yes";
        controlMaster = "auto";
        controlPath = "~/.ssh/control-%r@%h:%p";
        controlPersist = "10m";
      };
    };
  };

  services.ssh-agent.enable = true;
}
