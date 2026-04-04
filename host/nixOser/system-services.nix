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
      packages = [pkgs.terminus_font];
      earlySetup =true;
      keyMap = "us";
      useXkbConfig = false; # use xkb.options in tty.
    };


  #enable chrony for network time sync
  services.chrony.enable = true;
  services.chrony.extraConfig = ''
   makestep 1.0 3
  '';


  environment.variables = {
      NIXOS_OZONE_WL = "1";
    };


  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "eurosign:e";


  # XDG portals (important for Wayland apps)
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];


  # Enable flakes on your system
  nix.settings.experimental-features = ["nix-command" "flakes"];


}

