{ inputs, ... }:
let
  username = inputs.self.lib.rootTree.data.profile.content.name;
in
{
  users.groups.greeter.members = [ username ];

  hjem = {
    extraModules = [
      inputs.noctalia.hjemModules.default
    ];

    users.${username} = {
      programs.noctalia = {
        enable = true;
        # settings = { };
      };
    };
  };

  services.displayManager.noctalia-greeter = {
    enable = true;

    # settings = {
    #   cursor.size = 24;
    #   keyboard.layout = "us";
    # };

    # cursorTheme = {
    #   package = pkgs.adwaita-icon-theme;
    #   name = "Adwaita";
    # };
  };
}
