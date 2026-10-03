{ inputs, ... }:
let
  username = inputs.self.lib.rootTree.data.profile.content.name;
in
{
  hjem = {
    extraModules = [
      inputs.umbriel.hjemModules.default
    ];

    users.${username} = {
      programs.umbriel = {
        enable = true;

        settings = {
          general.autostart = [ "noctalia" ];
        };
      };
    };
  };

  virtualisation.vmVariant.systemd.user.services.umbriel.environment.WLR_RENDERER_ALLOW_SOFTWARE =
    "1";
}
