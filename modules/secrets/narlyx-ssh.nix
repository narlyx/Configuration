{
  home-manager.users.narlyx.home.file.".ssh/id_ed25519.pub".text = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKTun89j+M9wpS4WkXDgUwTgz6cWj8oSl8Qy6TQhXOyt";
  age.secrets.narlyx-ssh = {
    file = ./narlyx-ssh.age;
    path = "/home/narlyx/.ssh/id_ed25519";
    mode = "600";
    owner = "narlyx";
  };
}
