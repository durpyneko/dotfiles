{ config, pkgs, ... }:
{
  # * Samba shares
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

  # * Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # Fix audio crackling with pipewire
    # This helped:
    # https://www.reddit.com/r/linux_gaming/comments/1gy347h/comment/lylqijj/
    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 1024;
        "default.clock.min-quantum" = 1024;
        "default.clock.max-quantum" = 1024;
      };
    };
  };

  services.printing.enable = false;
}
