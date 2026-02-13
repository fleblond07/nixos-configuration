{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    neovim
    lua
    python3
    nodejs_22
    poetry
    docker-compose
  ];

  fonts.packages = with pkgs; [
  nerd-fonts.fira-code
  nerd-fonts.droid-sans-mono
  nerd-fonts.noto
  nerd-fonts.hack
  nerd-fonts.ubuntu
  ];
}

