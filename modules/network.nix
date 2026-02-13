{ config, pkgs, ...}:

{
  # Networking configuration
  networking.hostName = "nixos-main";
  networking.networkmanager.enable = true;
  services.printing.enable = true;
  networking.firewall.allowedTCPPorts = [ 24800 ];
}
