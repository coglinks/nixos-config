{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.incogshift = {
      search.force = true;
      search.default = "ddg";
      search.engines = {
        "Nix Packages" = {
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };
        "Home Manager Options" = {
          urls = [
            {
              template = "https://home-manager-options.extranix.com/";
              params = [
                {
                  name = "release";
                  value = "master";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "hm" ];
        };
      };

      settings = {
      };

      userChrome = ''                         
        /* some css */                        
      '';                                      

      extensions = {
        force = true;
        packages = with inputs.firefox-addons.packages."x86_64-linux"; [
          bitwarden
          indie-wiki-buddy
          ublock-origin
          raindropio
          sponsorblock
          darkreader
          tridactyl
          tree-style-tab
          youtube-shorts-block
        ];
      };
    };
  };
}
