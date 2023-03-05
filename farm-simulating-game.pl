use strict;
use warnings;

# Define initial values
my $money = 1000;
my $seeds = 10;
my $crops = 0;
my $harvested = 0;

# Loop until user quits
while (1) {
    # Display current status
    print "\nYour farm:\n";
    print "Money: \$$money\n";
    print "Seeds: $seeds\n";
    print "Crops: $crops\n";
    print "Harvested: $harvested\n";

    # Prompt for action
    print "\nWhat would you like to do?\n";
    print "1. Buy seeds (10 seeds for \$10)\n";
    print "2. Plant seeds\n";
    print "3. Harvest crops\n";
    print "4. Sell crops\n";
    print "5. Quit\n";
    print "Enter your choice: ";

    # Get user input
    my $choice = <STDIN>;
    chomp $choice;

    # Handle user input
    if ($choice == 1) {
        if ($money < 10) {
            print "You don't have enough money to buy seeds.\n";
        } else {
            $money -= 10;
            $seeds += 10;
            print "You bought 10 seeds for \$10.\n";
        }
    } elsif ($choice == 2) {
        if ($seeds == 0) {
            print "You don't have any seeds to plant.\n";
        } else {
            $seeds--;
            $crops++;
            print "You planted a seed.\n";
        }
    } elsif ($choice == 3) {
        if ($crops == 0) {
            print "You don't have any crops to harvest.\n";
        } else {
            $crops--;
            $harvested++;
            print "You harvested a crop.\n";
        }
    } elsif ($choice == 4) {
        if ($harvested == 0) {
            print "You don't have any crops to sell.\n";
        } else {
            my $sale_price = $harvested * 2;
            $money += $sale_price;
            $harvested = 0;
            print "You sold your crops for \$$sale_price.\n";
        }
    } elsif ($choice == 5) {
        print "Thanks For Playing!\n";
        last;
    } else {
        print "Invalid choice.\n";
    }
}
