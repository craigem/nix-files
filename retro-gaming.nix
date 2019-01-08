# Configuration for 

{ config, pkgs, ... }:

{
  # Retro Gaming Packages
  environment.systemPackages = with pkgs; [
    emulationstation
    libretro.stella
  ];

}
