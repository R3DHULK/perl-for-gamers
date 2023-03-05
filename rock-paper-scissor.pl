#!/usr/bin/perl

use strict;
use warnings;

my @choices = qw(rock paper scissors);
my $player_score = 0;
my $computer_score = 0;

print "Welcome to Rock-Paper-Scissors game!\n";

while (1) {
    print "Choose your move (rock, paper, or scissors): ";
    chomp(my $player_choice = lc <STDIN>);
    my $computer_choice = $choices[int rand @choices];
    
    # Determine winner
    my $result;
    if ($player_choice eq $computer_choice) {
        $result = "tie";
    } elsif ($player_choice eq "rock" && $computer_choice eq "scissors" ||
             $player_choice eq "paper" && $computer_choice eq "rock" ||
             $player_choice eq "scissors" && $computer_choice eq "paper") {
        $result = "player";
        $player_score++;
    } else {
        $result = "computer";
        $computer_score++;
    }
    
    # Print result
    print "You chose $player_choice, and the computer chose $computer_choice. ";
    if ($result eq "tie") {
        print "It's a tie!\n";
    } else {
        print "The $result wins this round.\n";
    }
    
    # Print scores
    print "Current scores: You $player_score - $computer_score Computer\n";
    
    # Ask to play again
    print "Do you want to play again? (y/n): ";
    chomp(my $play_again = lc <STDIN>);
    last if $play_again ne "y";
}

print "Thanks for playing!\n";
