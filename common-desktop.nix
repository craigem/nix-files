# Configuration for common desktop requirements

{ config, pkgs, ... }:

{
  # Configure Firefox and Chromium
  nixpkgs.config = {
    allowUnfree = true;
    firefox = {
      enableGoogleTalkPlugin = true;
      enableAdobeFlash = false;
    };

    chromium = {
      enablePepperFlash = false; # Chromium removed support for Mozilla (NPAPI) plugins so Adobe Flash no longer works
      enablePepperPDF = true;
    };
  };

  # Common Desktop Packages
  environment.systemPackages = with pkgs; [
    chromium
    digikam
    firefoxWrapper # install Firefox with support for plugins
    libreoffice-fresh
  ];

}
