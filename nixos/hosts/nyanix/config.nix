{ config, pkgs, ... }:
{
  time.timeZone = "Africa/Johannesburg";
  i18n.defaultLocale = "en_GB.UTF-8";

  # Required for samba ?
  networking.firewall.enable = true;
  networking.firewall.allowPing = true;
}
