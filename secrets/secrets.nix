let

  user-narlyx = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKTun89j+M9wpS4WkXDgUwTgz6cWj8oSl8Qy6TQhXOyt";

  server-achilles = "";
  server-artemis = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEly9AGqbyq1ZISR8VjrF90cEic+13UFmkjY4I5rIw7c";

in {

  "pocket-id-key.age".publicKeys = [ user-narlyx server-artemis ];
  "pocket-id-api.age".publicKeys = [ user-narlyx server-artemis ];

}
