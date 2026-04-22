{ modules, ... }: {

  imports = [
    modules.roles.base
  ];

  # Ssh key
  users.users.root.openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKTun89j+M9wpS4WkXDgUwTgz6cWj8oSl8Qy6TQhXOyt" ];

}
