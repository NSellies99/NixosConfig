{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    clamav
  ];

  systemd.services.clamd = {
    description = "ClamAV Daemon";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.clamav}/bin/clamd --foreground=yes";
      Restart = "on-failure";
      User = "clamav";
      Group = "clamav";
      PrivateTmp = true;
      RuntimeDirectory = "clamav";
      RuntimeDirectoryMode = "0755";
    };
  };

  systemd.services.freshclam = {
    description = "ClamAV Virus Database Updater";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.clamav}/bin/freshclam --foreground=yes";
      Restart = "on-failure";
      User = "clamav";
      Group = "clamav";
      PrivateTmp = true;
      RuntimeDirectory = "clamav";
      RuntimeDirectoryMode = "0755";
    };
  };
}
