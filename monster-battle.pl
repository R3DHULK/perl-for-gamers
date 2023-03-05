#!/usr/bin/perl

use strict;
use warnings;

# Define the player's starting health and attack
my $player_health = 100;
my $player_attack = 20;

# Define the monster's starting health and attack
my $monster_health = 50;
my $monster_attack = 10;

# Main game loop
while ($player_health > 0 && $monster_health > 0) {
    # Display the player's health and the monster's health
    print "Player health: $player_health\n";
    print "Monster health: $monster_health\n";

    # Prompt the player to choose an action
    print "Choose an action (attack/run): ";
    my $action = lc(<STDIN>);
    chomp($action);

    # Handle the player's action
    if ($action eq "attack") {
        # Calculate the damage dealt by the player
        my $damage = int(rand($player_attack)) + 1;
        print "You deal $damage damage to the monster!\n";
        $monster_health -= $damage;

        # Check if the monster is dead
        if ($monster_health <= 0) {
            print "You have defeated the monster!\n";
            last;
        }

        # Calculate the damage dealt by the monster
        $damage = int(rand($monster_attack)) + 1;
        print "The monster deals $damage damage to you!\n";
        $player_health -= $damage;

        # Check if the player is dead
        if ($player_health <= 0) {
            print "You have been defeated by the monster.\n";
            last;
        }
    } elsif ($action eq "run") {
        # Calculate the chance of successfully escaping
        my $chance = int(rand(2));

        if ($chance == 0) {
            print "You failed to escape from the monster!\n";

            # Calculate the damage dealt by the monster
            my $damage = int(rand($monster_attack)) + 1;
            print "The monster deals $damage damage to you!\n";
            $player_health -= $damage;

            # Check if the player is dead
            if ($player_health <= 0) {
                print "You have been defeated by the monster.\n";
                last;
            }
        } else {
            print "You successfully escaped from the monster!\n";
            last;
        }
    } else {
        print "Invalid action. Please choose attack or run.\n";
    }
}

# End of game loop
