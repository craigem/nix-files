# Configuration for an ASUS 701 EeePC4G-BK004

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix  # Include the results of the hardware scan.
      ./common-desktop.nix
      ./users-hamish.nix
      ./users-logan.nix
      ./games-kids.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "teintidh";         # Define your hostname.
  networking.networkmanager.enable = true;  # Enables network support via NetworkManager.

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

  programs.ssh.startAgent = true;
  programs.zsh.enable = true; # Enable zsh
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.ohMyZsh.enable = true;

  # List services that you want to enable:
  services.acpid.enable = true;
  powerManagement.enable = true;

  services.openssh.enable = true;
  services.xserver.enable = true;
  services.xserver.libinput.enable = true;               # Enable touchpad support.
  services.xserver.desktopManager.plasma5.enable = true; # Enable KDE

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };
  hardware.bluetooth.enable = true;
  hardware.bluetooth.extraConfig = "
    [General]
    Enable=Source,Sink,Media,Socket
  ";

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
    extraGroups = ["wheel" "networkmanager" ];
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
