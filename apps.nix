{pkgs, ... }: {

    # Essentials
    environment.systemPackages = with pkgs; [
        podman
        git
        distrobox
        nodejs
        waybar
        wofi
        hyprpaper
    ];

    #Steam App
    programs.steam = {
        enable = true;
    };


    #Flatpak Service
    services.flatpak.enable = true;


}
