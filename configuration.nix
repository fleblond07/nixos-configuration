{ config, pkgs, ... }:

{
  imports =
    [
      modules/network.nix
      modules/gaming.nix
      modules/nvidia.nix
      modules/dev.nix
      modules/desktop.nix
      ./hardware-configuration.nix
    ];

  # Don't touch this
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  # Global config
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Desktop config
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "intl";
    };
  };
  console.keyMap = "us-acentos";

  # Sound config
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # User config
  users.users.r00ps = {
    isNormalUser = true;
    description = "r00ps";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  # Programs
  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
	deskflow
	git
  ];

  system.stateVersion = "25.11";

}
