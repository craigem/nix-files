# Configuration for Hamish

{ config, pkgs, ... }:

{

  users.users.hamish = {
    isNormalUser = true;
    uid = 1001;
    group = "hamish";
    extraGroups = ["networkmanager" ];
    hashedPassword = "$6$DzxcNG4SS7$rx1bE9Nadw/2Dk5FlGVvyMdZjbSyeaJL8Kd/NaU3hVvSrSvevSP7CLCSaKX2tzBUx4i4QdjZ5eRr6BJKh7vSG1";
  };

}
