{
  description = "Hyprland Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    vibepanel.url = "github:prankstr/vibepanel";

    matugen = {
      url = "github:InioX/matugen";
      # Optional: Pin to a specific version
      # url = "github:InioX/matugen?ref=refs/tags/matugen-v0.10.0";
    };
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      };

    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, matugen, mangowm, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      nixosConfigurations.nixOser = nixpkgs.lib.nixosSystem {
        # This 'specialArgs' line is the magic part!
        specialArgs = { inherit inputs self; }; 
        modules = [
           # Define the system platform here to fix the evaluation warning
          { nixpkgs.hostPlatform = system; }

          ./host/nixOser/configuration.nix
         # These pull the logic directly from your inputs above
          mangowm.nixosModules.mango 
          home-manager.nixosModules.home-manager
          # Add the Matugen NixOS module here
          inputs.matugen.nixosModules.default 
          
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs self; };
            home-manager.users.optimist23 = import ./home/optimist23/default.nix; # path to home-manager


          }
        ];
      };
    };
}
