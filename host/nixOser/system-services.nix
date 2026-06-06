{ config, pkgs, ... }:

{
  networking = {
    hostName = "nixOser";
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Africa/Lagos";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    packages = [ pkgs.terminus_font ];
    earlySetup = true;
    keyMap = "us";
    useXkbConfig = false; # use xkb.options in tty.
  };

  # Enable chrony for network time sync
  services.chrony.enable = true;
  services.chrony.extraConfig = ''
    makestep 1.0 3
  '';

  # Crucial for Electron apps (VS Code, Discord, Spotify) to run natively on Wayland/Hyprland
  environment.variables = {
    NIXOS_OZONE_WL = "1";
  };

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "eurosign:e";

  # Enable SVG Support
  services.xserver.gdk-pixbuf.modulePackages = [ pkgs.librsvg ];

  # XDG portals (Crucial for screen sharing, file pickers, and opening apps under Hyprland)
  xdg.portal = {
    enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk 
      pkgs.xdg-desktop-portal-hyprland # ADDED: Required for screen sharing/capturing in Hyprland
    ];
    config.common.default = "*"; # ADDED: Forces portal backends to initialize properly
  };

  # Enable flakes on your system
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # OPTIONAL MACBOOK FIX: MacBook Airs use Broadcom Wi-Fi chips. 
  # If your Wi-Fi isn't working or dropping connections, uncomment the line below:
  hardware.enableRedistributableFirmware = true; 
}
