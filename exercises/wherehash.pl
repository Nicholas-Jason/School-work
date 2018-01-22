 my %where = (
     Gary => "Piscataway",
     Lucy => "Hackensack",
     Ian  => "Mahwah",
     Samantha => "Hoboken"
          );
foreach $who(keys %where)
{
print"$who lives in $where{$who}\n";
}

# use 'each' function to iterate through hash key/value
          # pairs
          my ($name, $town);
             # an assignable list of variables
          while ( ($name, $town) = each %where ) {
             print "$name lives in $town\n";
          }

print "Gary exists in the hash!\n" if exists $where{Gary};