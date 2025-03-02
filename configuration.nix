{ config, pkgs, ... }:
{
  imports = [ 
    ./hardware/framework-specific.nix
    ./hardware/hardware-configuration.nix
    ./hardware/video-acceleration.nix

    ./network.nix

    ./wayland.nix
  ];

  time.timeZone = "Europe/Belgrade";

  boot.loaders.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.sessionVariables = rec {
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XCURSOR_SIZE = "24";
  };

  users.users.takimoysha = {
    isNormalUser = true;
    extraGroups = [ "wheel" "users" "docker"];
  };

  environment.systemPackages = with pkgs; [
    vim
    neovim
    alacritty
    nmcli
    wget
  ];

  services.printing.enable = true;

  system.stateVersion = "24.05";
}
