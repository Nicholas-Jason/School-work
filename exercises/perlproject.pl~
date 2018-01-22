# Ken Magner
#Nicholas-Jason Roach
# Perl Project

use LWP::Simple;
use HTML::LinkExtor;
use WWW::Mechanize;

#help function

sub help
{
    print "Usage: perl -w perlproject.pl 'Term' 'Room' [> filename.html] ... \n\n";
    print "List of options \n";
    print "	Required \n";
    print "		Term	: which term(semester) the class is in, e.g. '16/SP - Spring 2016' \n";
    print "		Room	: which classroom \n\n";
    print "	Optional \n";
    print "		--help	:display this help screen and sample usage \n";
    print "		--terms	:list all currently available terms and exit \n";
    print "		--rooms	:list all classrooms and exit \n";
}

sub terms
{
    my $mech = WWW::Mechanize->new(); 
    my $url = "http://www2.monmouth.edu/muwebadv/wa3/search/SearchClasses.aspx"; 
    $mech->get($url); 

    #print $mech->content;

    @terms = ( $mech->content =~ /16P2\/[A-Z]+\">(.+)<\/option>/g, $mech->content =~ /16\/[A-Z]+\">(.+)<\/option>/g  );

print "Current available terms: ";

foreach $content1 (@terms)
{
    print sort $content1, "\n";
}

}

sub gettermsched
{
    if($_[0] =~ /current/)
	{
	    $term = "16/SP - 2016 Spring";
	}
    else
	{
	    $term = $_[0];
	}	
	
     $mech = WWW::Mechanize->new();
	 $url = "http://www2.monmouth.edu/muwebadv/wa3/search/SearchClasses.aspx";
    $mech->get($url);

    $mech->set_fields("ddlTerm"=>$term);
    $mech->click("btnSubmit");

    #$semester = $mech->content;

    #print $semester;
}

sub uniq {
    my %seen;
        grep !$seen{$_}++, @_;
        }

sub rooms
{
    gettermsched("current");

    $semester = $mech->content;

    #print $semester;

    
    while ($semester =~ /(<td>|\<br\> )(\w+\s+\w+\s+)(LEC|LAB)/g)
    {
    
	push @roomsunsorted, $2;
	@norepeatrooms = uniq(@roomsunsorted);
	@rooms = sort @norepeatrooms;
    }
    
    print "Rooms for current term: ";
    
    foreach $roomnumbers (@rooms)
    {
	print sort $roomnumbers, "\n";
    }
    
}

sub roomsched 
{

    gettermsched($ARGV[0]);

    $roomsched = $mech->content;
                    
$room=$ARGV[1]; # This would be a script command line argument.

($building, $roomnum) = split /\s+/, $room;

# Stage 1: Since class information spans multiple lines of HTML, create a match group ($1) 
#          that contains class code and schedule, assign it to $classline.
#          (See reference #2 below.)
while ($roomsched =~ /(<a href="javascript:Openpopup.+?nameandtitle">.+?\<br\>.+?<\/span><\/a>\s+<\/td><td>.+?)<a href=/gs)
{
   $classline = $1;
   
      # Push $classline HTML into @classes array if it contains the classroom ($building & 
         # $roomnum) we are searching for. 
            if ( $classline =~ /$building\s+$roomnum/ )
               {
                     push @classes, $classline;
                    
                        }
                        }
                        
                        print "\nSchedule for $room:\n";
                        
                        # Stage 2: Scan through HTML line for each class in @classes and extract the fields we want
                        #          to display.
                        foreach my $class ( @classes )
                        {
                           # Extract course code (See reference #1 below).
                              # The course code is between nameandtitle"> and a \<br\> tag
                                ($coursecode) = ( $class =~ / ([A-ZA-Z]-)((.+)-)([0-9]{2}) /g);# nameandtitle\">(.+)\<br\> /g;
                                 
                                    # Extract course schedule.
                                       # A schedule looks like: >HH   305      LEC  T       10:05AM 11:25AM<
                                          # or sometimes like:     > HH   305      LEC  TH      02:25PM 04:20PM<
                                        ($schedule) = ( $class =~ /\<\/td\>\<td\>(.+)\<\/td\>\<td\>\.[A-Z] /g) ;
                                             # Print the course code and the corresponding schedule.
                                            print $coursecode, $schedule, "\n";
                                            
                                             }
                                            
}                                             
# Run help if  no args or first arg contains --help
if ( $#ARGV == -1 || $ARGV[0] =~ /--help/)
{
    help();
    exit(0);
}

# Run terms if first arg contains --terms
if ($ARGV[0] =~ /--terms/)
{
    terms();
    exit(0);
}

# Run rooms if first arg contains --rooms
if ( $ARGV[0] =~ /--rooms/)
{
    rooms();
    #gettermsched("current");
    exit(0);
}

if( $ARGV[0] =~ /16/)
{
    roomsched();
    exit(0);
}
