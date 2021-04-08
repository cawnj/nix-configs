{ pkgs, ... }:

{
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    replication = {
      role = "master";
      slaveHost = "%";
      masterUser = "replication";
      masterPassword = builtins.readFile "/var/secrets/mysql/replication_password";
    };
  };
  networking.firewall.allowedTCPPorts = [ 3306 ];
}
