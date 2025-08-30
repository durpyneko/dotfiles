{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # * System
  environment.systemPackages = with pkgs; [
    git
    lsd
    dua
    vim
    yazi
    fish
    btop
    wget
    yt-dlp
    fastfetch
    ffmpeg-full
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.open-dyslexic
  ];

  # * Users
  # User: durpy
  users.users.durpy = {
    packages = with pkgs; [
      # * Apps
      vlc
      gimp
      kitty
      vscode
      bottles
      qbittorrent
      github-desktop
      unstable.vesktop
      kdePackages.kate
      # kdePackages.wallpaper-engine-plugin

      # * Dev
      rustup
      python3

      # * Tui
      nyaa
      ani-cli

      # * Misc
      lolcat
      cowsay
      fortune
      vlc-bittorrent
      nixfmt-rfc-style
    ];
  };
}
