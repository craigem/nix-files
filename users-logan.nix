# Configuration for Hamish

{ config, pkgs, ... }:

{

  users.groups.logan.gid = 1002;

  users.users.logan = {
    isNormalUser = true;
    uid = 1002;
    group = "logan";
    extraGroups = ["networkmanager" ];
    hashedPassword = "$6$KVlggjTGUM0Uy8GU$WBSGNpPOkJ2rn0TC5S1DZdPit0TbbsekY5clZtl57L7eRXtslkza9NXKkAry7J.RH2tgpMzKoGkk3z8kFLwqm.";
  };

}
