{ pkgs, ... }:
let
  username = inputs.self.lib.rootTree.data.profile.content.name;
in
{
  programs.virt-manager.enable = true;
  environment = {
    shellAliases.win = "virsh -c qemu:///system start win && virt-viewer -c qemu:///system -f -w win";

    sessionVariables.OSINFO_SYSTEM_DIR = "${pkgs.osinfo-db}/share/osinfo";

    systemPackages = with pkgs; [
      dnsmasq # exec 'virsh net-autostart default'
      libosinfo
      osinfo-db
      virt-viewer
    ];
  };

  virtualisation = {
    spiceUSBRedirection.enable = true;
    libvirtd = {
      enable = true;
      qemu.vhostUserPackages = [ pkgs.virtiofsd ];
    };
    vmVariant.users.users = {
      root.initialPassword = "root";
      nixos.initialPassword = "nixos";
      ${username}.initialPassword = username;
    };
  };

  networking.firewall.trustedInterfaces = [ "virbr0" ];
}
