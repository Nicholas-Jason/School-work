#1- Read each line from english sorted
#2- Get length of each word that we read
#3- Increment the word length array element that corresponds to the length of each word
#4 - Print word length array elements
while ( $word = <STDIN> ) { 
	    chomp($word);
	    $length = length($word);
#Use length as an array subscript, so if
#$length is 5, increment array[5].
	    
	$list{$length}++;
          }
 foreach $item ( sort keys %list ) {
             print "$item lives in $list{$item}\n";
          }

#my ($w,$characters);

#print "Word length \t\t Occurrences \n\n";

#for(my $i = 1; $i <= $#wordlength; $i++)
#{
   # print "$i \t\t\t $wordlength[$i] \n";
#}

