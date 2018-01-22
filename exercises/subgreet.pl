greet( "Jim", "Bob", "Russ" );
             # There isn't a set number of function arguments or a
             # function "prototype" to speak of
sub greet
 {
             foreach my $arg ( @_ ) {
                print "Hello $arg!\n";
             }

             print "You're first, $_[ 0 ].\n";
             print "You're second, $_[ 1 ].\n";
             print "You're last, $_[ 2 ].\n";
 }