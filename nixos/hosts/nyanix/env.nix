{ config, pkgs, ... }:

{
  environment.variables = {
    VLC_PLUGIN_PATH = "${pkgs.vlc-bittorrent}/lib/vlc/plugins";
    VLC_LUA_PATH = "${pkgs.vlc-bittorrent}/lib/vlc/lua/extensions";
  };
}
