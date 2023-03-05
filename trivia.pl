#!/usr/bin/perl

# Trivia game in Perl

# Define the trivia questions and answers
my %trivia = (
    "What is the capital of France?" => "Paris",
    "What is the largest mammal in the world?" => "Blue whale",
    "What is the smallest country in the world?" => "Vatican City",
    "What is the highest mountain in the world?" => "Mount Everest",
    "What is the largest country in the world by area?" => "Russia",
);

# Shuffle the questions randomly
my @questions = keys %trivia;
@questions = sort { rand() <=> 0.5 } @questions;

# Keep track of the user's score
my $score = 0;

# Loop through the questions and ask them one by one
foreach my $question (@questions) {
    # Print the question and ask for the user's answer
    print "$question\n";
    my $answer = <STDIN>;
    chomp($answer);

    # Check the user's answer and update the score accordingly
    if ($answer eq $trivia{$question}) {
        print "Correct!\n";
        $score++;
    } else {
        print "Incorrect. The answer is $trivia{$question}.\n";
    }
}

# Print the final score
print "Your final score is $score out of " . scalar(@questions) . ".\n";

