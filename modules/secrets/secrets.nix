let
  narlyx-user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKTun89j+M9wpS4WkXDgUwTgz6cWj8oSl8Qy6TQhXOyt";
  juno-host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGCY/TtH9rhMQszL0kDOI6mU8Ml7CVzQiNkNO/Cu+Z1s";  
  juuzuo-host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKXwQ+0SXFaqH3maziIlOvF5UiVjgIDMu/9AVVTNDH99";
in {
  "narlyx-ssh.age".publicKeys = [ narlyx-user juno-host juuzuo-host ];
}
