{ modules, pkgs, ... }: {

  imports = [
    modules.features.narlyx.starship
    modules.features.narlyx.zoxide
  ];

  programs.zsh.enable = true;
  users.users.narlyx.shell = pkgs.zsh;

  home-manager.users.narlyx = {
  
    home.file.".zimrc".text = ''
      zmodule zsh-users/zsh-syntax-highlighting
      zmodule zsh-users/zsh-autosuggestions
      zmodule zsh-users/zsh-completions
      zmodule MichaelAquilina/zsh-auto-notify
      zmodule ohmyzsh/ohmyzsh --root plugins/git
    '';

    programs.zsh = {
      
      enable = true;

      initContent = ''
        # Zim vars
        ZIM_CONFIG_FILE=~/.zimrc
        ZIM_HOME=~/.zim

        # Downloading Zim
        if [[ ! -e ''${ZIM_HOME}/zimfw.zsh ]]; then
          curl -fsSL --create-dirs -o ''${ZIM_HOME}/zimfw.zsh \
          https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
        fi

        # Auto update Zim
        if [[ ! ''${ZIM_HOME}/init.zsh -nt ''${ZIM_CONFIG_FILE:-''${ZDOTDIR:-''${HOME}}}/.zimrc ]]; then
          source ''${ZIM_HOME}/zimfw.zsh init
        fi

        # Loading Zim
        source ''${ZIM_HOME}/init.zsh
      '';

      # Command history
      history = {
        size = 5000;
        save = 5000;
        ignoreAllDups = true;
        ignoreSpace = true;
        share = true;
        append = true;
      };

      # Alias
      shellAliases = {
        "reload" = "source ~/.zshrc";
        "rebuild" = "nixos-rebuild switch --flake ~/Configuration";
        "cls" = "clear";
        "rm" = "${pkgs.rmtrash}/bin/rmtrash";
        "rmdir" = "${pkgs.rmtrash}/bin/rmdirtrash";
        "rd" = "rmdir";
        "l" = "${pkgs.eza}/bin/eza  -lah --icons --git";
        "ls" = "${pkgs.eza}/bin/eza --oneline --icons --git";
        "ll" = "${pkgs.eza}/bin/eza --oneline -ah --icons --git";
        "tree" = "${pkgs.eza}/bin/eza --tree --icons --ignore-glob=.git";
        "cat" = "${pkgs.bat}/bin/bat";
      };

    };

  };

}
