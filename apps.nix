{pkgs, ... }: {

    # Essentials
    environment.systemPackages = with pkgs; [
        discord
        podman
        boxbuddy
        git
        flatpak
        neofetch
        distrobox
    ];

    #Steam App
    programs.steam = {
        enable = true;
    };


    #Flatpak Service
    services.flatpak.enable = true;


}
