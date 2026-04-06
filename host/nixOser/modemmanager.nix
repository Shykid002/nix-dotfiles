{ pkgs, ... }: {

  # Enable the ModemManager service
  networking.modemmanager.enable = true;

  # Correct way to enable FCC unlock scripts
  networking.modemmanager.fccUnlockScripts = [
    {
      # The 'id' is required to match your hardware. 
      # Use "*" to apply scripts to all detected modems.
      id = "*"; 
      path = "${pkgs.modemmanager}/share/ModemManager/fcc-unlock.available.d/*";
    }
  ];

  # System-wide tools for management and debugging
  environment.systemPackages = with pkgs; [
    modemmanager      # Provides 'mmcli'
    usbutils          # Provides 'lsusb' to see your device IDs
    modem-manager-gui # Visual tool for SMS/Signal
  ];

  # Performance & Privacy Settings
  networking.networkmanager.settings = {
    main = {
      rc-manager = "resolvconf";
      auth-polkit = "true";
    };
    device = {
      wifi.scan-rand-mac-address = "no";
    };
  };
}

