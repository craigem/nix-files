# Configuration for an ASUS 701 EeePC4G-BK004

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
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

  # Groups to add
  users.groups.craige.gid = 1000;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.craige = {
    isNormalUser = true;
    uid = 1000;
    group = "craige"   
    extraGroups = ["wheel" ];
    openssh.authorizedKeys.keyFiles = [
      (builtins.fetchurl {
        url = "https://git.mcwhirter.io/craige.keys";
        # sha512 = "8b0c6b3959a78152a802679ce310f86654b1c74f60f8d29291f5629d361b5227c37147d113a06682e44e5d4120527c1e32244e80c0563764caf2d7bd6341e932"
      })
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