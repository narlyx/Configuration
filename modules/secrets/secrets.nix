let
  narlyx-user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKTun89j+M9wpS4WkXDgUwTgz6cWj8oSl8Qy6TQhXOyt";
  juno-host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGCY/TtH9rhMQszL0kDOI6mU8Ml7CVzQiNkNO/Cu+Z1s";  
in {
  "narlyx-ssh.age".publicKeys = [ narlyx-user juno-host ];
}
