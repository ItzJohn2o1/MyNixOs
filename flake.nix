{
  description = "NixOS Flake Configuration";

  inputs = {
    # Specify the version of NixOS you want to use
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";


  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # Replace 'your-hostname' with your actual system hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      # Use "aarch64-linux" if on ARM (like Raspberry Pi)
      system = "x86_64-linux";
      modules = [
        # This pulls in your main configuration file
        # Note: hardware-configuration.nix must be in this folder too
        ./configuration.nix
      ];
    };
  };
}
