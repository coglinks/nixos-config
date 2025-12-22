{
  pkgs,
  inputs,
  pkgs-custom,
  pkgs-unstable,
  username,
  host,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    sharedModules = [
      inputs.sops-nix.homeManagerModules.sops
    ];
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit
        inputs
        username
        pkgs-custom
        pkgs-unstable
        host
        ;
    };
    users.${username} = {
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.05";
      programs.home-manager.enable = true;
    };
    backupFileExtension = "hm-backup";
  };

  users.users = {
    ${username} = {
      isNormalUser = true;
      # doesnt work for some reason
      # hashedPasswordFile = config.sops.secrets.my-password.path;
      initialPassword = "test";
      description = "${username}";
      extraGroups = [
        "networkmanager"
        "kvm"
        "wheel"
      ];
      shell = pkgs.bash;
    };
  };
  nix.settings.allowed-users = [ "${username}" ];

  users.defaultUserShell = pkgs.bash;

  environment = {
    sessionVariables = {
      EDITOR = "nvim";
    };
    shells = [
      pkgs.bash
    ];
  };
  # The following is a workaround that patches an issue created by setting Nushell as the login shell. See: https://wiki.nixos.org/wiki/Nushell
  # programs.bash.interactiveShellInit = # bash
  #   ''
  #     if ! [ "$TERM" = "dumb" ] && [ -z "$BASH_EXECUTION_STRING" ]; then
  #       exec nu
  #     fi
  #   '';
}
