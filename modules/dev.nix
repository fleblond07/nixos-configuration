{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Terminal and essentials stuff
    kitty
    neovim
    lua
    git
    deskflow
    lazygit

    # Dev deps
    python3
    nodejs_22
    poetry
    docker-compose

    # IA
    opencode

    # Notes, todo
    obsidian

    # TEST TO REMOVE LATER
    lan-mouse
  ];

  fonts.packages = with pkgs; [
  nerd-fonts.fira-code
  nerd-fonts.droid-sans-mono
  nerd-fonts.noto
  nerd-fonts.hack
  nerd-fonts.ubuntu
  ];
}

