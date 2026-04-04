{ inputs, pkgs, config, lib, ... }:

with lib; let
  cfg = config.drivers.amdgpu;
in {
  options.drivers.amdgpu = {
    enable = mkEnableOption "Enable AMD Drivers for Daily Use";
  };

  config = mkIf cfg.enable {
    # 1. Basic Graphics (Required for Hyprland to even start)
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        libva-vdpau-driver       # Hardware video acceleration (YouTube/VLC)
        libvdpau-va-gl   # Video acceleration bridge
      ];
    };

    # 2. Critical for A8 Vision APUs
    # This forces the modern driver so Hyprland doesn't lag or crash
    boot.initrd.kernelModules = [ "amdgpu" ];
    boot.kernelParams = [
      "radeon.si_support=0" "amdgpu.si_support=1" 
      "radeon.cik_support=0" "amdgpu.cik_support=1" 
    ];

    # 3. Use the amdgpu driver for the display server
    services.xserver.videoDrivers = ["amdgpu"];
  };
}

