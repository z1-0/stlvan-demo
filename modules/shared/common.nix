{ lib, pkgs, ... }:
{
  system.stateVersion = lib.versions.majorMinor lib.version;

  time.timeZone = "Asia/Shanghai";

  environment = {
    localBinInPath = true;
    pathsToLink = [ "/share/zsh" ];
    systemPackages = with pkgs; [
      curl
      vim
      wget
    ];
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
