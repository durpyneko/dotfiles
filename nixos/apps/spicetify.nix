{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  apps = inputs.spicetify.legacyPackages.${pkgs.stdenv.system}.apps;
  themes = inputs.spicetify.legacyPackages.${pkgs.stdenv.system}.themes;
  extensions = inputs.spicetify.legacyPackages.${pkgs.stdenv.system}.extensions;
in
{
  imports = [
    inputs.spicetify.nixosModules.spicetify
  ];

  programs.spicetify = {
    enable = true;
    theme = themes.lucid;
    colorScheme = "dark";
    spotifyPackage = pkgs.spotify;
    enabledExtensions = with extensions; [
      shuffle
      goToSong
      queueTime
      hidePodcasts
      showQueueDuration
    ];
    enabledCustomApps = with apps; [
      localFiles
      newReleases
      historyInSidebar
    ];
  };
}
