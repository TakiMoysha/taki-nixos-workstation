{config, pkgs, ...}:
{
  networking.hostName = "";
  networking.wireless.enable = true;
  networking.wireless.userControlled.enable = true;

  networking.firewall.enable = false;

  #Define your networks here
  #Syntax : 
  #networking.wireless.networks.Network-Name.psk = "password";
}
