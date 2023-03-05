#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw(shuffle);

# Teams and their corresponding abilities
my %teams = (
    'Liverpool'  => 90,
    'Manchester United' => 85,
    'Manchester City' => 95,
    'Chelsea' => 85,
    'Arsenal' => 80,
    'Tottenham Hotspur' => 80,
    'Leicester City' => 75,
    'Everton' => 70,
    'Wolverhampton Wanderers' => 70,
    'West Ham United' => 70
);

# Create an array of team names
my @team_names = keys %teams;

# Shuffle the teams to randomize the order of play
@team_names = shuffle(@team_names);

# Set the team scores to zero
my %team_scores;
foreach my $team_name (@team_names) {
    $team_scores{$team_name} = 0;
}

# Display the teams and their abilities
print "Welcome to the text-based football game!\n\n";
print "Teams:\n";
foreach my $team_name (@team_names) {
    print "$team_name - Ability: $teams{$team_name}\n";
}
print "\n";

# Set the number of matches to play
my $num_matches = 3;

# Play the matches
for (my $match_num = 1; $match_num <= $num_matches; $match_num++) {

    # Randomly select the home team and away team
    my $home_team = $team_names[rand @team_names];
    my $away_team = $team_names[rand @team_names];

    # Ensure that the home team and away team are different
    while ($home_team eq $away_team) {
        $away_team = $team_names[rand @team_names];
    }

    # Display the match information
    print "Match $match_num: $home_team vs. $away_team\n";

    # Calculate the result of the match
    my $home_score = int(rand(4) + $teams{$home_team} / 20);
    my $away_score = int(rand(4) + $teams{$away_team} / 20);

    # Update the team scores
    if ($home_score > $away_score) {
        $team_scores{$home_team} += 3;
        print "$home_team wins $home_score-$away_score!\n";
    } elsif ($home_score < $away_score) {
        $team_scores{$away_team} += 3;
        print "$away_team wins $away_score-$home_score!\n";
    } else {
        $team_scores{$home_team} += 1;
        $team_scores{$away_team} += 1;
        print "It's a draw! $home_team $home_score-$away_score $away_team\n";
    }

    # Display the updated team scores
    print "Team Scores:\n";
    foreach my $team_name (@team_names) {
        print "$team_name - $team_scores{$team_name}\n";
    }
    print "\n";
}

# Determine the winner
my @winning_teams;
my $winning_score = 0;
foreach my $team_name (@team_names) {
    if ($team_scores{$team_name} > $winning_score) {
        @winning_teams = ($team_name);
        $winning_score = $team_scores{$team_name};
    } elsif ($team_scores{$team_name} == $winning_score) {
        push @winning_teams, $team_name;
    }
}

# Print out the winning teams and their score
# Display the winning team(s) and their scores
# print "\nWinning Team(s):\n";
# foreach my $team_name (@winning_teams) {
#    print "$team_name: $team_scores{$team_name}\n";
#}

# Display the winner
if (@winning_teams == 1) {
    print "The winner is $winning_teams[0] with a score of $winning_score!\n";
} else {
    my $tie_message = join ", ", @winning_teams;
    print "It's a tie between $tie_message with a score of $winning_score!\n";
}
