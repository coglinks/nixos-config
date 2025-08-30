{ pkgs, inputs, ... }:

{
  imports = [ inputs.textfox.homeManagerModules.default ];

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
        /* Only works in Firefox if layout.css.has-selector.enabled is set to true in about:config . */
        html#main-window body:has(#sidebar-box[sidebarcommand=treestyletab_piro_sakura_ne_jp-sidebar-action][checked=true]:not([hidden=true])) #TabsToolbar {
          visibility: collapse !important;
        }
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

  textfox = {
      enable = true;
      profile = "incogshift";
      config = {
        background = {
          color = "#1a1b26";
        };
        border = {
          color = "#73daca";
          width = "4px";
          transition = "1.0s ease";
          radius = "3px";
        };
        displayHorizontalTabs = true;
        displayWindowControls = true;
        displayNavButtons = true;
        displayUrlbarIcons = true;
        displaySidebarTools = false;
        displayTitles = false;
        newtabLogo = "   __            __  ____          \A   / /____  _  __/ /_/ __/___  _  __\A  / __/ _ \\| |/_/ __/ /_/ __ \\| |/_/\A / /_/  __/>  </ /_/ __/ /_/ />  <  \A \\__/\\___/_/|_|\\__/_/  \\____/_/|_|  ";
        font = { 
          family = "Fira Code";
          size = "15px";
          accent = "#654321";
        };
      };
  };
}
