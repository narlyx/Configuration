let

  narlyx-user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKTun89j+M9wpS4WkXDgUwTgz6cWj8oSl8Qy6TQhXOyt";

  juno-host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGCY/TtH9rhMQszL0kDOI6mU8Ml7CVzQiNkNO/Cu+Z1s";  
  acetylene-host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKXwQ+0SXFaqH3maziIlOvF5UiVjgIDMu/9AVVTNDH99";

  krylith-server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP/4E5ikS7v1uSsiEFO0eCAXJgC94xDq/3yCZS0kQ33s";

in {
  "narlyx-ssh.age".publicKeys = [ narlyx-user juno-host acetylene-host ];
  "narlyx-password.age".publicKeys = [ narlyx-user juno-host acetylene-host ];
}
