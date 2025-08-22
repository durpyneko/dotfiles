{ config, pkgs, ... }:

{
  # * Groups
  users.groups.nyashare = { };

  # * Users
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.durpy = {
    isNormalUser = true;
    description = "durpy";
    extraGroups = [
      "networkmanager"
      "wheel"
      "nyashare"
    ];
  };
}
