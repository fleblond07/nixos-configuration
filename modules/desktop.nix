{ config, pkgs, ... }:

{

  # Desktop config
  # displayManager
  services.displayManager.gdm.enable = false;
  services.displayManager.sddm.enable = true;

  # Keeping this in case I quickly want to change back
  services.desktopManager.gnome.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  # ChatGPT Stuff - Look into what is it
  xdg.portal = {
      enable =  true;
      extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    };
  security.polkit.enable = true;
  services.dbus.enable = true;

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "intl";
    };
  };
  console.keyMap = "us-acentos";
}
