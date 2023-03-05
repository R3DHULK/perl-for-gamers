use strict;
use warnings;

my $score = 0;
my $time_limit = 30;
my $start_time = time();

while ((time() - $start_time) < $time_limit) {
    my $hole_num = int(rand(9)) + 1;
    print "\033[2J";  # Clear the screen
    print "Score: $score\n";
    print "Time left: " . ($time_limit - (time() - $start_time)) . "\n\n";
    print " 1 2 3\n";
    print "A " . ($hole_num == 1 ? "O" : " ") . " " . ($hole_num == 2 ? "O" : " ") . " " . ($hole_num == 3 ? "O" : " ") . "\n";
    print "B " . ($hole_num == 4 ? "O" : " ") . " " . ($hole_num == 5 ? "O" : " ") . " " . ($hole_num == 6 ? "O" : " ") . "\n";
    print "C " . ($hole_num == 7 ? "O" : " ") . " " . ($hole_num == 8 ? "O" : " ") . " " . ($hole_num == 9 ? "O" : " ") . "\n";
    print "Enter the hole letter and number: ";
    chomp(my $guess = <STDIN>);
    if ($guess =~ /^[A-C][1-3]$/ && (($guess eq "A$hole_num") || ($guess eq "B$hole_num") || ($guess eq "C$hole_num"))) {
        print "You got it!\n";
        $score++;
        sleep(1);
    } else {
        print "Missed!\n";
        sleep(0.5);
    }
}

print "\033[2J";  # Clear the screen
print "Time's up!\n";
print "Final score: $score\n";
