{ pkgs, ... }: {

imports = [
  ./plasma.nix
];

  home.username = "morajohn";
  home.homeDirectory = "/home/morajohn";
  home.stateVersion = "24.11";

  # Setup for ollama on vscode
  home.file.".continue/config.json".text = builtins.toJSON {
  name = "Local";
  version = "1.0.0";
  schema = "v1";

  models = [
    {
      # 2026 update requires BOTH to avoid the "missing title" error
      title = "Qwen";
      name = "Qwen";

      provider = "ollama";
      model = "qwen2.5-coder:1.5b";
      apiBase = "http://192.168.50.242:11434";

      # Explicit roles are mandatory for the model to activate
      roles = ["chat" "edit" "apply"];
    }
  ];

  tabAutocompleteModel = {
    title = "Autocomplete";
    name = "Autocomplete";
    provider = "ollama";
    model = "qwen2.5-coder:1.5b";
    apiBase = "http://192.168.50.242:11434";
  };
};


  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      continue.continue
      dbaeumer.vscode-eslint
      bbenoist.nix
      catppuccin.catppuccin-vsc
    ];
    userSettings = {
      "editor.formatOnSave" = true;
      "continue.telemetryEnabled" = false;
      "workbench.colorTheme" = "Catppuccin Macchiato";
    };
  };

}
