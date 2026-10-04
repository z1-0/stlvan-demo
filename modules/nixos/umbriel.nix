{ inputs, pkgs, ... }:
let
  username = inputs.self.lib.rootTree.data.profile.content.name;
in
{
  hjem = {
    extraModules = [ inputs.umbriel.hjemModules.default ];

    users.${username} = {
      programs.umbriel = {
        enable = true;
        package = pkgs.umbriel;

        settings = {
          general.autostart = [ "noctalia" ];
        };
      };
    };
  };
}
