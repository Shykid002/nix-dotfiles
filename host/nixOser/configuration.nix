{ config, pkgs, inputs, ... }:

{
  imports = [ ./hardware-configuration.nix
              ../../system # Path to your new module
              ./system-services.nix
              ../../profile/amd
              ./modemmanager.nix
            ];


  # Use the systemd-boot EFI boot loader.
   boot.loader = {
      systemd-boot.enable = false;
      # grub.extraEntries = ''

       efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
         };

    grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = false;
        };

    timeout = 5;

 };

 # Enable plymouth
  boot = {

    kernelParams = [ 
        "quiet"
        "splash"
        "maxcpus=2"
        "radeon.dpm=1"
        ];


	plymouth.enable = true;
    plymouth.themePackages = [ pkgs.plymouth-matrix-theme ];
    #plymouth.themePackages = [ pkgs.adi1090x-plymouth-themes ];
    plymouth.theme = "matrix";


  };

   # Enable thermald
    services.thermald.enable = true;

	
    # Enable TLP

  services.tlp = {
        enable = true;
        settings = {
            CPU_SCALING_GOVERNOR_ON_AC = "powersave";
            CPU_SCALING_GOVERNOR_ON_Bat = "powersave";
            CPU_ENERGY_PERF_POLICY_ON_AC = "power";
            CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        };



  };

# Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_6_18;

  # Enable X11 
  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];
  xdg.terminal-exec = {
  enable = true;
  settings = {
    default = [ "kitty.desktop" ];
  };
};



  # Graphics acceleration
  hardware.graphics.enable = true;
  

  services.displayManager.ly = {
    enable = true;
    # Optional: customize the look
    settings = {
      animation = "matrix"; # The cool falling text effect
      restore = true;       # Remembers your last used session (Hyprland)
      clock = "%c";
    };
  };


 


    environment.sessionVariables = {
          WLR_NO_HARDWARE_CURSORS = "1";
           };




      # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };


programs.dconf.enable = true;
  	

  # MangoWM
  programs.mango = {
    enable = true;
  # addLoginEntry = true; # ensures it shows up in SDDM
  };


  # Nix path and registry to flake inputs
  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs}"];
    registry.nixpkgs.flake = inputs.nixpkgs;
  };


  # configure nixpkgs instance
  nixpkgs.config = {
    allowUnfree = true;
  };
  
  # System packages
  environment.systemPackages = with pkgs; [
	    adwaita-icon-theme           # Standard GNOME icons (fallback for many apps)
        bibata-cursors               # Modern, pixel-perfect cursor theme
        ffmpegthumbnailer            # Lightweight video thumbnailer for file managers
        feh                          # Fast and light image viewer/wallpaper setter
        fluent-icon-theme            # Clean, Material-design inspired icon theme
        github-cli                   # Official GitHub command-line tool (gh)
        go
        gcc
        glib                         # Low-level core library (required for GSettings)
        gnome-pomodoro               # Time management/productivity timer
        gsettings-desktop-schemas    # Shared settings for desktop applications
        imagemagick                  # Powerful CLI suite for image manipulation
        kdePackages.breeze-icons     # High-quality KDE/Plasma icon set
        libnotify                    # Library for sending desktop notifications
        lxqt.lxqt-policykit          # Authentication agent for elevated permissions
        nwg-look                     # GTK theme/icon/font customization tool for Wayland
        procps                       # System process utilities (top, ps, free, etc.)
        thunar                       # Fast and easy-to-use Xfce file manager
        tumbler                      # D-Bus service for generating file thumbnails
        xdg-user-dirs                # Tool to manage "Standard" folders (Documents, etc.)
        yad                          # Tool to create graphical dialogs from CLI scripts
        # adw-gtk3                   # Libadwaita theme for GTK3 apps (commented out)

       ];


 
  # System version (leave as is)
  system.stateVersion = "24.05";
}

