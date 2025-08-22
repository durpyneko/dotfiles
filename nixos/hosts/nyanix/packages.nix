{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # * System
  environment.systemPackages = with pkgs; [
    wget
    btop
    fastfetch
    lsd
    ffmpeg-full
    yt-dlp
    fish
    git
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
      kdePackages.kate
      unstable.vesktop
      vscode
      bottles
      vlc
      gimp
      qbittorrent
      kitty
      github-desktop

      # * Misc
      lolcat
      fortune
      cowsay
      nixfmt-rfc-style
    ];
  };
}
