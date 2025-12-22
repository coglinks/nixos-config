{
  description = "template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        # ENVIRONMENT_VARIABLE = "SOMTHING";

        packages = with pkgs; [
          playwright-driver.browsers
          (python313.withPackages (
            ps: with ps; [
              python-dotenv
              httpx
              playwright
              numpy
              aiohttp
              pyyaml
              lxml
              requests
              beautifulsoup4
            ]
          ))
        ];

        shellHook = ''
          exec nu
        '';
      };
    };
}
