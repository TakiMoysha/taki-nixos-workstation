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
  # boot.loaders.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

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

  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";

    XCURSOR_SIZE = "24";
  };

  system.stateVersion = "24.05";
}
