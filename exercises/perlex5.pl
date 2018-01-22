#Read each line of the array
# Accepts command line arguments
$count = 0;

#help function
sub help
{
    print "Usage: perlex5.pl <option> filename1 filename2 ...\n\n";
    print "Options:\n";
    print "	-h, -help, --help\n";
    print "	-last, --last\n";
    print"	-first, --first\n";
    print"	-sid,--sid\n";
}

# Run help
if($#ARGV == -1 || $ARGV[0] =~ /-h/)
{
    help();
    exit(0);
}
# Check for sort method
$arg0 = shift @ARGV;
if($arg0 =~ /last/)
{
    $sort = "last";
}
elsif ($arg0 =~ /first/)
{
    $sort = "first";
}
elsif ($arg0 =~ /sid/)
{
    $sort = "sid";
}


while($student = <>)
{

    ($last,$first,$id) = ($student =~ /\W?(\w+)\,\s(\w+|\w+\s\w+\.)\,\W?(\w+)/);
   if (!defined $last) {

}
   elsif($sort =~ /last/)

    {
	
	$student = "$last $first $id"; 
	
    }
elsif($sort =~ /first/)

    {
	$student = "$first $last $id";
	
    }
else

    {
	$student = "$id $first $last";
	
    }
   $roster[$count] = $student;
        $count++;
        
}
 sort(@roster);
foreach $e (@roster)
{
 print "$e\n";
}
