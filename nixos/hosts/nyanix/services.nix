{ config, pkgs, ... }:
{
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "nyashare";
        "server string" = "nixos-smb";
        "netbios name" = "NIXOS";
        "security" = "user";
      };
      "Nya-storage" = {
        "path" = "/mnt/Nya-storage/";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "valid users" = "durpy";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "durpy";
      };
    };
  };

  # [Docs] The samba-wsdd service is used to advertise the shares to Windows hosts.
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  services.openssh.enable = true;

  services.printing.enable = true;
}
