{ pkgs, ... }: {

  # Enable the ModemManager service
  networking.modemmanager.enable = true;

  # Correct way to enable FCC unlock scripts for Lenovo/Dell/ThinkPad modems
  # This links the default scripts provided by the modemmanager package
  networking.modemmanager.fccUnlockScripts = [
    {
      path = "${pkgs.modemmanager}/share/ModemManager/fcc-unlock.available.d/*";
    }
  ];

  # System-wide tools for management and debugging
  environment.systemPackages = with pkgs; [
    modemmanager      # Provides 'mmcli'
    usbutils          # Provides 'lsusb'
    modem-manager-gui # Visual tool for SMS/Signal
  ];

  # Performance & Privacy Settings
  networking.networkmanager.settings = {
    main = {
      rc-manager = "resolvconf";
      auth-polkit = "true";
    };
    device = {
      # Disabling MAC randomization often helps with cellular ISP stability
      wifi.scan-rand-mac-address = "no";
    };
  };
}

