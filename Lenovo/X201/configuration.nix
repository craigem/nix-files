# Configuration for an ASUS 701 EeePC4G-BK004

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix  # Include the results of the hardware scan.
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "iolair-beag";        # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_AU.UTF-8";
  };

  time.timeZone = "Australia/Brisbane";

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    vim tmux byobu
  ];

  programs.zsh.enable = true; # Enable zsh

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  users.defaultUserShell = pkgs.zsh; # Set the default shell for all users
  users.mutableUsers = false;        # Remove any users not defined in here

  users.users.root = {
    hashedPassword = "$6$TdDmapr9JzPm0$ROOYmjzYO6.kph8wpT2cv3O90imyKA5QRP/Vsm8kUfaQ8SFCQ2RY0aLv9KMlWXchRD/O5oVg/t5TL4R8YCbx.0";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDtjE0YstRzlh+Zhlj03th9DYOkMqJ5xHUcderBq151K craige@mcwhirter.io"
    ];
  };

  # Groups to add
  users.groups.craige.gid = 1000;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.craige = {
    isNormalUser = true;
    uid = 1000;
    group = "craige";
    extraGroups = ["wheel" ];
    hashedPassword = "$6$Dm/8qURprNY$5MS7BlOqwOdduyi.r9uG3uUnLYQMusNO35sTkDz2ooG8ED6YaRleEnTIeag/Y3tQdkmh9D.XJxDJ0vUcr58f1/";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDtjE0YstRzlh+Zhlj03th9DYOkMqJ5xHUcderBq151K craige@mcwhirter.io"
    ];
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?
  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = https://nixos.org/channels/nixos-18.09;

}
