{ inputs, pkgs, config, lib, ... }:

with lib; let
  cfg = config.drivers.intel-gpu;
in {
  options.drivers.intel-gpu = {
    enable = mkEnableOption "Enable Intel Graphics Drivers for MacBook Air 2017";
  };

  config = mkIf cfg.enable {
    # 1. Basic Graphics & Hardware Video Acceleration (Crucial for smooth Hyprland UI & YouTube)
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver   # VA-API driver for Broadwell (Intel HD 6000) and newer
        intel-vaapi-driver   # Legacy VA-API driver fallback for older Intel chips
        libvdpau-va-gl       # Video acceleration bridge for VDPAU applications
      ];
    };

    # 2. Intel Early Kernel Mode Setting (KMS) & Driver Tweaks
    boot.initrd.kernelModules = [ "i915" ]; # Pre-loads Intel drivers to prevent screen flashing at boot
    boot.kernelParams = [
      "i915.enable_guc=3"                   # Enables Intel Graphics Microcode scheduling
      "i915.enable_fbc=1"                   # Enables Framebuffer Compression (saves significant battery)
    ];

    # 3. Use the modern kernel modesetting driver for the display layer
    services.xserver.videoDrivers = [ "modesetting" ];
  };
}
