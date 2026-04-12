{ lib, ... }: {
  home-manager.users.narlyx.programs.starship = {

    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  
    settings = {
      # New line before each prompt
      add_newline = true;

      # Custom format
      format = lib.concatStrings [
        "[╭─](bold white)$os $hostname $directory $git_status\n"
        "[╰─](bold white)$shell$nix_shell $character"
      ];

      # Prompt character
      character = {
        success_symbol = "[~#@](bold white)";
        error_symbol = "[~#@](bold red)";
      };

      # Directory
      directory = {
        format = "[$path]($style)[$read_only]($read_only_style)";
        read_only = "  ";
        style = "bold blue";
        read_only_style = "bold red";
      };

      # Shell labels
      shell = {
        disabled = false;
        format = "[$indicator](italic white)";
        zsh_indicator = "zsh";
        nu_indicator = "nu";
        bash_indicator = "bash";
        unknown_indicator = "???";
      };

      # Nix
      nix_shell = {
        disabled = false;
        format = "[ via ](italic white)[NIX-SHELL](bold red)";
      };

      # User name
      username = {
        disabled = false;
        show_always = true;
        format = "[$user](bold italic green)";
      };

      # Host name
      hostname = {
        disabled = false;
        ssh_only = false;
        format = "[@$hostname](bold italic bright-green)$ssh_symbol";
        ssh_symbol = "[ via ](bold italic bright-green)[SSH](bold red)";
      };

      # Operating system icons
      os = {
        disabled = false;
        format = "[$symbol](bold white)";
        symbols = {
          NixOS = " ";
          Macos = " ";
          Unknown = " ";
        };
      };

      # Git status
      git_status = {
        format = "([ \\[$all_status$ahead_behind\\]]($style))";
        style = "bold cyan";
      };

    };

  };
}
