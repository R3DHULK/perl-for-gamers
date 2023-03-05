#!/usr/bin/perl

use strict;
use warnings;

# Initialize the game
my $name = "";
my $suspect = "";
my $weapon = "";
my $motive = "";

# Welcome message
print "Welcome to the Detective Game!\n";
print "What's your name? ";
chomp($name = <STDIN>);

# Introduction
print "\nHello, $name! You are a detective and you've been called to investigate a crime scene.\n";
print "A wealthy businessman has been murdered in his office and you have to find out who did it.\n";
print "Are you ready to start? (yes/no) ";
chomp(my $start = <STDIN>);
if ($start ne "yes") {
    print "OK, goodbye!\n";
    exit;
}

# Investigate the crime scene
print "\nYou arrive at the crime scene and see the victim lying dead on the floor.\n";
print "There are three suspects who were in the building at the time of the murder:\n";
print "1. John, the victim's business partner\n";
print "2. Mary, the victim's secretary\n";
print "3. Tom, the victim's competitor\n";
print "Who do you want to question first? (enter 1, 2 or 3) ";
chomp(my $suspect_choice = <STDIN>);
if ($suspect_choice == 1) {
    $suspect = "John";
} elsif ($suspect_choice == 2) {
    $suspect = "Mary";
} elsif ($suspect_choice == 3) {
    $suspect = "Tom";
} else {
    print "Invalid choice!\n";
    exit;
}
print "You question $suspect and find out that...\n";
print "1. $suspect was in a meeting with the victim at the time of the murder\n";
print "2. $suspect had an argument with the victim earlier in the day\n";
print "3. $suspect has a history of violence\n";
print "What do you want to ask about? (enter 1, 2 or 3) ";
chomp(my $suspect_info = <STDIN>);
if ($suspect_info == 1) {
    $motive = "$suspect was in a meeting with the victim at the time of the murder";
} elsif ($suspect_info == 2) {
    $motive = "$suspect had an argument with the victim earlier in the day";
} elsif ($suspect_info == 3) {
    $motive = "$suspect has a history of violence";
} else {
    print "Invalid choice!\n";
    exit;
}

# Find the murder weapon
print "\nYou decide to look for the murder weapon.\n";
print "You find three objects in the room that could be the murder weapon:\n";
print "1. A knife\n";
print "2. A gun\n";
print "3. A bat\n";
print "Which one do you want to examine? (enter 1, 2 or 3) ";
chomp(my $weapon_choice = <STDIN>);
if ($weapon_choice == 1) {
    $weapon = "knife";
} elsif ($weapon_choice == 2) {
    $weapon = "gun";
} elsif ($weapon_choice == 3) {
    $weapon = "bat";
} else {
    print "Invalid choice!\n";
    exit;
}
print "You examine the $weapon and find...\n";
print "1. Go to the victim's house\n";
print "2. Investigate the murder scene further\n";
print "3. Talk to the witnesses\n";

my $choice = <STDIN>;
chomp $choice;

if ($choice == 1) {
    print "You arrive at the victim's house and knock on the door.\n";
    print "A woman answers the door and introduces herself as the victim's wife.\n";
    print "You ask her some questions and she tells you that her husband had been acting strange recently.\n";
    print "You ask her if she knows anyone who might have wanted to harm her husband.\n";
    print "She tells you that her husband had been having an affair and that the woman's husband had threatened him.\n";
    print "You make a note of this information and thank her for her time.\n";
} elsif ($choice == 2) {
    print "You take another look at the murder scene and notice a piece of fabric stuck to a nearby branch.\n";
    print "You carefully remove the fabric and find that it matches the color and material of the victim's shirt.\n";
    print "You realize that this could be an important clue and bag the fabric for later analysis.\n";
} elsif ($choice == 3) {
    print "You talk to the witnesses and learn that the victim had been seen arguing with a man at the local bar the night before.\n";
    print "You head to the bar and talk to the bartender.\n";
    print "He tells you that the man the victim had been arguing with was his brother, and that they had a long-standing feud.\n";
    print "He gives you his brother's address and you make a note of it.\n";
} else {
    print "Invalid choice. Please try again.\n";
}
