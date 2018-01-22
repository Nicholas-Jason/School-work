while ( $word = <STDIN> ) { 
	    chomp($word);
	    if(length($word) <= 7)
	#if( $word =~/^,{1,7}$/)
	{
	print $word, "\n";
	} 
     }


	
   

