# Configuration for

{ config, pkgs, ... }:

{
  # Retro Gaming Packages
  environment.systemPackages = with pkgs; [
    extremetuxracer # High speed arctic racing game based on Tux Racer
    freeciv         # Multiplayer (or single player), turn-based strategy game
    freedroidrpg    # Isometric 3D RPG similar to game Diablo
    gcompris        # Educational software suite, kids aged 2 to 10
    jre             # Required by Minecraft (via multimc)
    lincity         # City simulation game
    minetest        # Infinite-world block sandbox game
    multimc         # Minecraft launcher
    nethack-qt      # Rogue-like game
    pingus          # A puzzle game with mechanics similar to Lemmings
    superTux        # Classic 2D jump'n run sidescroller game
    superTuxKart    # A Free 3D kart racing game
    wesnoth         # Battle for Wesnoth server and client
  ];

}
