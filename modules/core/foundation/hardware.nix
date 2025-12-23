{ pkgs, ... }:
{
  # OpenGL
  hardware.graphics = {
    enable32Bit = true;
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      (intel-vaapi-driver.override { enableHybridCodec = true; })
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };

  hardware.enableRedistributableFirmware = true;

  zramSwap.enable = true;
}
