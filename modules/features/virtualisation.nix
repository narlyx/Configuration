{
  virtualisation.virtualbox.host = {
    enable = true;
    # enableHardening = false;
    # enableExtensionPack = true; (ts takes forever to compile twin)
  };

  # programs.virt-manager.enable = true;
  # virtualisation = {
  #   libvirtd.enable = true;
  #   spiceUSBRedirection.enable = true;
  # };

  # home-manager.users.narlyx.dconf.settings = {
  #   "org/virt-manager/virt-manager/connections" = {
  #     autoconnect = [ "qemu:///system" ];
  #     uris = [ "qemu:///system" ];
  #   };
  # };
}
