{ pkgs, inputs, self, ...}:

{

             imports = [
                ./user.nix
                ./audio
            ];


          environment.systemPackages = with pkgs;[
                awww                         # Tool to fetch/display random cute animal images
                blueman                      # Bluetooth manager (GTK GUI)
                bluez                        # Official Linux Bluetooth protocol stack
                bluez-tools                  # Command-line tools for Bluetooth
                brightnessctl                # Control device brightness (backlight/LEDs)
                brave                        # Privacy-focused web browser
                cava                         # Console-based Audio Visualizer for ALSA/MPD
                curl                         # Tool for transferring data with URLs
                fastfetch                    # Modern, faster alternative to neofetch
                git                          # Distributed version control system
                grim                         # Grab images from Wayland (screenshot tool)
                kdePackages.qt6ct            # Qt6 Configuration Tool
                kdePackages.qtimageformats   # Additional image format support for Qt6
                libnotify                    # Library for sending desktop notifications
                libsForQt5.qt5ct             # Qt5 Configuration Tool
                matugen                      # Material You color scheme generator
                mpc                          # Command-line client for MPD
                mpd-mpris                    # MPRIS bridge for MPD (player control integration)
                neovim                       # Extensible text editor based on Vim
                notify                       # Command-line notification sender
                pavucontrol                  # PulseAudio/Pipewire volume control GUI
                playerctl                    # CLI media player controller (mpris)
                piper-tts                    # Local neural text-to-speech engine
                poppler_utils                # PDF rendering and conversion utilities
                python3                      # Python programming language
                qt6.qt5compat                # Qt6 module for Qt5 compatibility
                qt6.qtbase                   # Base Qt6 framework
                qt6.qtdeclarative            # Qt6 QML and declarative framework
                qt6.qtmultimedia             # Qt6 multimedia support
                qt6.qtsvg                    # Qt6 SVG image support
                quickshell                   # Toolkit for creating Wayland shells/widgets
                slurp                        # Select a region in a Wayland compositor
                tree                         # Display directory trees in the terminal
                unzip                        # Utility for extracting .zip files
                wezterm                      # GPU-accelerated terminal emulator
                wl-clipboard                 # Wayland copy/paste command line tools
                zathura                      # Highly customizable document viewer
                zathuraPkgs.zathura_pdf_mupdf # MuPDF backend for Zathura
                
                # nemo                       # File manager (commented out)
                # inputs.matugen.packages.${system}.default # Matugen flake input (commented out)
                    
                           ];
    # Bluetooth 
    
    hardware.bluetooth = {
        enable = true;      # Enables the bluez service
        powerOnBoot = true; # Automatically powers on the bluetooth controller
    };


    # Garbage collecter
    nix.settings.auto-optimise-store = true;
  
        nix.gc = {
            automatic = true;
            dates = "monthly";
            options = "--delete-older-than 30d";
        };

    fonts.packages = [
        pkgs.font-awesome 
        pkgs.dejavu_fonts
        pkgs.nerd-fonts.symbols-only
        pkgs.nerd-fonts.iosevka-term-slab
    ];


    # Polkit for Privilge management
    security.polkit.enable = true;
    

    # GVFS required to show Trash, Network Shares and MTP
    services.gvfs.enable = true;

    # Thumbnail support
    services.tumbler.enable = true;



  # Enable CUPS to print documents.
   services.printing.enable = true;



  # Enable touchpad support (enabled default in most desktopManager).
   services.libinput.enable = true;



}
