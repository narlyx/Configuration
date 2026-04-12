{
  home-manager.users.narlyx.programs.librewolf = {
    enable = true;
    policies.DefaultDownloadDirectory = "\${home}/Downloads";
    settings = {
      "identity.fxaccounts.enabled" = true;
      "privacy.resistFingerprinting" = false;
      "toolkit.theme" = "system";
    };
  };
}
