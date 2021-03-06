# Configuration for an ASUS 701 EeePC4G-BK004

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix  # Include the results of the hardware scan.
      ./retro-gaming.nix            # Enables retro gaming
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  nixpkgs.config = {
    packageOverrides = pkgs: {
      stdenv = pkgs.stdenv // {
        platform = pkgs.stdenv.platform // {
          kernelExtraConfig = ''
            HIGHMEM64G? n  # 32-bit proc with > 4G RAM
            HIGHMEM4G y    # 32-bit proc with =< 4G RAM
          '';
        };
      };
    };
  };

  networking.hostName = "dhu";        # Define your hostname.
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
    vim
    tmux
    byobu
    SDL
    SDL2
  ];

  programs.zsh.enable = true; # Enable zsh

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    #extraModules = [ pkgs.pulseaudio-modules-bt ];
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
    hashedPassword = "$6$kH8RIgIarr$4U3pErme9EbwbdJuQlo/SB8L5gg1EU5BiilH.RE5Dtw/9tUeh6AtungyX/WeIS5PRpWvcnsfIEttnq/OyxbOc/";
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
    hashedPassword = "$6$TbF3Qpo5FbFdD0$NKQQOXIE/uVxuK0nELO1pi7d3Y0o.FWi8dGA5gFkwNqe.YMTPWATkTfO3WD3Ped61ueRMeHGBGjY.ke2jphyo1";
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
