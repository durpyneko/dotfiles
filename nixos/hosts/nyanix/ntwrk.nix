{ config, pkgs, ... }:

{
  # Required for samba ?
  networking.firewall.enable = true;
  networking.firewall.allowPing = true;

  networking.extraHosts = ''
    108.181.20.35 files.catbox.moe
  '';
}
