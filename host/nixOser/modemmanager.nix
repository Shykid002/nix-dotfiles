{ pkgs, ... }: {
  
  # Crucial for laptop modems (Lenovo/Dell/ThinkPad)
  networking.networkmanager.enableFccUnlock = true;

  # Modern 4G/5G modems work best with these system-wide tools
  environment.systemPackages = with pkgs; [
    modemmanager      # Provides 'mmcli' for debugging
    usbutils          # Provides 'lsusb' to see your device
    modem-manager-gui # Visual tool to send SMS and check signal
  ];

  # Performance & Privacy Settings
  networking.networkmanager.settings = {
    # Helps prevent disconnects on some mobile networks
    main = {
      rc-manager = "resolvconf";
      auth-polkit = "true";
    };
    # Optional: Disable MAC randomization if your ISP is picky
    device = {
      wifi.scan-rand-mac-address = "no";
    };
  };
}

