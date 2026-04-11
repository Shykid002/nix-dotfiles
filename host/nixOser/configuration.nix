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

    timeout = 0;

 };

 # Enable plymouth
  boot = {

    kernelParams = [ 
        "quiet"
        "splash"
        ];


	plymouth.enable = true;
    plymouth.themePackages = [ pkgs.plymouth-matrix-theme ];
    #plymouth.themePackages = [ pkgs.adi1090x-plymouth-themes ];
    plymouth.theme = "matrix";


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
	    lxqt.lxqt-policykit  
        kdePackages.breeze-icons
        bibata-cursors
        nwg-look
#	    adw-gtk3
	    adwaita-icon-theme
	    imagemagick
	    yad
	    libnotify
	    procps
	    glib
	    procps
	    gsettings-desktop-schemas
	    xdg-user-dirs
        github-cli
        fluent-icon-theme
        thunar
        tumbler
        ffmpegthumbnailer
        gnome-pomodoro
  ];


 
  # System version (leave as is)
  system.stateVersion = "24.05";
}

