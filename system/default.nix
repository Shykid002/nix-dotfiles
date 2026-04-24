{ pkgs, inputs, self, ...}:

{

             imports = [
                ./user.nix
                ./audio
            ];


          environment.systemPackages = with pkgs;[
                git
                curl
                neovim
                unzip
                libnotify
                fastfetch
                wezterm
                brave
                zathura
                zathuraPkgs.zathura_pdf_mupdf
                tree
                kdePackages.qt6ct
                libsForQt5.qt5ct
		        mpd-mpris
                cava
	            brightnessctl
                matugen
                mpc
	        	notify
                piper-tts
                poppler-utils
                bluez
                bluez-tools
                blueman
                pavucontrol
                quickshell
                qt6.qt5compat
                 qt5.qtgraphicaleffects
                 qt5.qtdeclarative
                playerctl
                #nemo
                #inputs.matugen.packages.${system}.default
            ];


    
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
