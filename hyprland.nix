{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # 1. The "Basics"
      monitor = ",preferred,auto,1"; # Use 1.5 or 2 if your ThinkPad screen is tiny
      
      # 2. Keybinds (The most important part!)
      "$mod" = "SUPER";
      bind = [
        "$mod, return, exec, konsole"          # Open Terminal
        "$mod, space, exec, wofi --show drun" # Open App Launcher
        "$mod, backspace, killactive,"          # Close Window
        "$mod, M, exit,"                # Exit Hyprland (Back to Login)
        "$mod, F, togglefloating,"      # Make a window float
        
        # Workspace switching (Win + 1, Win + 2, etc)
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        # ... add as many as you need
      ];

      # 3. The "Look"
      decoration = {
        rounding = 10;
        blur.enabled = true;
      };

      # 4. Auto-start
      exec-once = [
        "waybar"
        "hyprpaper"
      ];
    };
  };
  programs.waybar = {
  enable = true;
  settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      modules-left = [ "hyprland/workspaces" "hyprland/mode" ];
      modules-center = [ "hyprland/window" ];
      modules-right = [ "network" "cpu" "memory" "battery" "clock" "tray" ];
      
      # Optional: Configure specific modules
      "battery" = {
          format = "{capacity}% {icon}";
          format-icons = ["" "" "" "" ""];
      };
    };
  };

  # 2. THE CSS STYLING
  style = ''
    * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
    }

    window#waybar {
        background: rgba(30, 30, 46, 0.5); /* Semi-transparent dark */
        color: #cdd6f4;
        border-bottom: 2px solid #89b4fa;
    }

    #workspaces button {
        padding: 0 5px;
        background: transparent;
        color: #cdd6f4;
    }

    #workspaces button.active {
        color: #89b4fa;
        border-bottom: 3px solid #89b4fa;
    }

    #clock, #battery, #cpu, #memory {
        padding: 0 10px;
        background-color: #313244;
        margin: 4px 2px;
        border-radius: 10px;
    }
  '';
};
}
