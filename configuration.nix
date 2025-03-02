{ config, pkgs, ... }:
{
  imports = [ 
    ./hardware/hardware-configuration.nix
    ./hardware/framework-specific.nix
    ./hardware/video-acceleration.nix
    ./hardware/ssd.nix

    ./network.nix

    ./wayland.nix
  ];

  time.timeZone = "Europe/Belgrade";

  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.grub.device = "/dev/sda";
  # boot.loaders.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  users.users.guest = {
    isNormalUser = true;
  };
  users.users.demo = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  }
  users.users.takimoysha = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker"];
  };

  environment.systemPackages = with pkgs; [
    vim
    neovim
    alacritty
    wget
  ];

  services.printing.enable = true;

  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";

    XCURSOR_SIZE = "24";
  };

  system.stateVersion = "24.05";
}
