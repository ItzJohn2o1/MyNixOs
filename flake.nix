{
  description = "NixOS Flake Configuration";

  inputs = {
    # Specify the version of NixOS you want to use
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

  home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix

        # --- ADD THIS LINE BELOW ---
        home-manager.nixosModules.home-manager
        # ---------------------------

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.morajohn = import ./home.nix;
        }
      ];
    };
  };
}
