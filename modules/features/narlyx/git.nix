{
  home-manager.users.narlyx.programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Narlyx";
        email = "shout@narlyx.dev";
      };
      push.rebase = true;
      # credential.helper = "${pkgs.gh}/bin/gh auth git-credential";
    };
  };
}

