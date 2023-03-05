#!/usr/bin/perl

use strict;
use warnings;

# Set initial values for the pet's attributes
my $hunger = 0;
my $happiness = 5;
my $energy = 5;

# Main game loop
while (1) {
    # Print the pet's status
    print "Cat status:\n";
    print "Hunger: $hunger\n";
    print "Happiness: $happiness\n";
    print "Energy: $energy\n\n";

    # Prompt the user for an action
    print "What would you like to do?\n";
    print "1. Feed\n";
    print "2. Play\n";
    print "3. Sleep\n";
    my $choice = <STDIN>;
    chomp $choice;

    # Perform the chosen action
    if ($choice == 1) {
        print "You feed the cat.\n";
        $hunger = 0;
    } elsif ($choice == 2) {
        print "You play with the cat.\n";
        $happiness++;
        $energy--;
    } elsif ($choice == 3) {
        print "You put the cat to sleep.\n";
        $energy = 5;
    } else {
        print "Invalid choice.\n";
    }

    # Update the pet's attributes
    $hunger++;
    $happiness-- if $hunger >= 5;
    $happiness++ if $energy >= 4;
    $energy-- if $choice != 3;

    # Check if the pet has died
    if ($hunger >= 10 || $happiness <= 0 || $energy <= 0) {
        print "Your cat has died.\n";
        last;
    }

    # Wait for a short time before printing the next status update
    sleep(1);
}
