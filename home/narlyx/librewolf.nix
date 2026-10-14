{
  programs.librewolf = {
    enable = true;
    policies.DefaultDownloadDirectory = "\${home}/Downloads";
    settings = {
      "privacy.resistFingerprinting" = false;
      "browser.tabs.inTitlebar" = 0;
      "toolkit.theme" = "system";
    };
  };
}
