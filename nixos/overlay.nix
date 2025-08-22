{inputs, ...}: {
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      # this is kind of cursed
      inherit (final) overlays;
      config.allowUnfree = true;
    };
  };

  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # vesktop = (prev.vesktop.override {
    #   withTTS = false;
    #   withMiddleClickScroll = true;
    # });

    # bottles = (prev.bottles.override {
    #   removeWarningPopup = true;
    # });
  };
}