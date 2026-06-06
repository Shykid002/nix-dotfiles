{ config, pkgs, inputs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ../../system 
    ./system-services.nix
    ../../profile/intel or wherever you saved the previous file
    ./modemmanager.nix
  ];

  # Use the GRUB EFI boot loader (Perfect for MacBooks)
  boot.loader = {
    systemd-boot.enable = false;
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

  # Boot parameters and Splash Screen
  boot = {
    # FIXED: Removed 'maxcpus=2' and 'radeon.dpm=1'
    kernelParams = [ 
      "quiet" 
      "splash" 
    ];

    plymouth = {
      enable = true;
      themePackages = [ pkgs.plymouth-matrix-theme ];
      theme = "matrix";
    };
  };

  # Intel-specific Power and Thermal Management
  services.thermald.enable = true; # Highly recommended for MacBooks to avoid overheating

  # Optimized TLP settings for a balance between battery and Hyprland performance
  services.tlp = {
    enable = true;
    settings = {
      # CHANGED: 'powersave' is fine, but 'power' on AC forces the Intel CPU into its lowest performance state.
      # 'balance_performance' ensures Hyprland doesn't stutter when plugged into charger.
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance"; 
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
    };
  };

  # Use a recent stable kernel (Linux 6.18 is a great choice)
  boot.kernelPackages = pkgs.linuxPackages_6_18;

  # Enable X11 / Display systems
  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];
  
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "kitty.desktop" ];
    };
  };

  # Graphics acceleration (Crucial for smooth Wayland animations)
  hardware.graphics.enable = true;

  # Display Manager (Ly Console Matrix Display Manager)
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix"; 
      restore = true;       
      clock = "%c";
    };
  };

  # Wayland Environment Fixes
  environment.sessionVariables = {
    # Intel works completely fine with hardware cursors. 
    # Turning this off can sometimes cause cursor flickering on Intel HD 6000.
    WLR_NO_HARDWARE_CURSORS = "0"; 
  };

  # Hyprland Setup
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.dconf.enable = true;

  # MangoHUD / MangoWM performance overlay
  programs.mango = {
    enable = true;
  };

  # Nix path and registry to flake inputs
  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs}"];
    registry.nixpkgs.flake = inputs.nixpkgs;
  };

  # Configure nixpkgs instance
  nixpkgs.config = {
    allowUnfree = true;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme           
    bibata-cursors               
    ffmpegthumbnailer            
    feh                          
    fluent-icon-theme            
    github-cli                   
    go
    gcc
    glib                         
    gnome-pomodoro               
    gsettings-desktop-schemas    
    imagemagick                  
    kdePackages.breeze-icons     
    libnotify                    
    lxqt.lxqt-policykit          
    nwg-look                     
    procps                       
    thunar                       
    tumbler                      
    xdg-user-dirs                
    yad                          
  ];

  # System version
  system.stateVersion = "24.05";
}
