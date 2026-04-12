{ modules, ... }: {

  imports = [
    modules.roles.base
    modules.users.narlyx
    modules.features.gnome
  ];

}
