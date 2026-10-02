{ lib, ... }:
{
  nixpkgs.hostPlatform = "x86_64-linux";

  networking.hostName = "shinelon";

  users.users.zion = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    hashedPassword = "$6$lE/xH591Oa8DKNzt$Bj80uYEaCISSnWE80AdG3WxQV3QCxLaGpS4SlAh0yF12YGD32oHYd.o8G8yXArIw8q49MxxTsvsqkX9zZWLrn/";
  };

  system.stateVersion = lib.versions.majorMinor lib.version;
}
