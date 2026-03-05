{ pkgs, ... }: {
  home.username = "morajohn";
  home.homeDirectory = "/home/morajohn";
  home.stateVersion = "24.11"; # Match your current NixOS version

  programs.home-manager.enable = true;

 home.file.".continue/config.json".text = builtins.toJSON {
      embeddingsProvider = {
        model = "nomic-embed-text";
        provider = "ollama";
      };
      models = [
        {
          apiBase = "http://192.168.50.242:11434";
          model = "qwen2.5-coder:1.5b";
          provider = "ollama";
          title = "Ollama - Chat";
        }
      ];
      tabAutocompleteModel = {
        apiBase = "http://192.168.50.242:11434";
        model = "qwen2.5-coder:1.5b";
        provider = "ollama";
        title = "Ollama - Autocomplete";
      };
    };

  # Configure VS Code with extensions
  programs.vscode = {
    enable = true;
    # Ensures extensions are managed ONLY by Nix
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      continue.continue      # Continue (LLM Assistant)
      dbaeumer.vscode-eslint # ESLint
      bbenoist.nix           # Nix language support
      catppuccin.catppuccin-vsc #catppuccin theme
    ];
    userSettings = {
      "editor.formatOnSave" = true;
      "continue.telemetryEnabled" = false;
      "workbench.colorTheme" = "Catppuccin Macchiato";

    };
  };
}
