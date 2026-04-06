{ pkgs, ... }: {

  # 1. Enable the ModemManager service
  networking.modemmanager.enable = true;

  # 2. Modern way to enable FCC unlock scripts (Replaces the removed enableFccUnlock)
  networking.modemmanager.fccUnlockScripts = [
    {
      # The 'id' field is required. Use "*" to apply to any detected modem.
      id = "*"; 
      path = "${pkgs.modemmanager}/share/ModemManager/fcc-unlock.available.d/*";
    }
  ];

  # 3. System-wide tools for management and debugging
  environment.systemPackages = with pkgs; [
    modemmanager      # Provides 'mmcli'
    usbutils          # Provides 'lsusb' to see your device IDs
    modem-manager-gui # Visual tool for SMS and Signal monitoring
  ];

  # 4. Performance & Privacy Settings (Corrected INI format)
  networking.networkmanager.settings = {
    main = {
      rc-manager = "resolvconf";
      auth-polkit = "true";
    };
    device = {
      # This fixes the "INI atom" error by using a quoted key
      "wifi.scan-rand-mac-address" = "no";
    };
  };

  # 5. Ensure NetworkManager is enabled (if not already in your main config)
  networking.networkmanager.enable = true;
}

