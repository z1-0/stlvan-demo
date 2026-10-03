{
  users.groups.greeter.members = [ username ];

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
