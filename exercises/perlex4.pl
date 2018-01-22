# read each line of cs371roster into a hash,
# swapping the order of the last name and first name in the process. 
#The hash key will be the student's full name, and the hash value will be the student ID.

while($student = <>)
{
    ($last,$first,$id) = split /,/, $student;
    $key = join",",($first,$last);
    $newroster{$key} = $id;
}

foreach $fullname (keys %newroster)
{
    print $fullname, " ",$newroster{$fullname}, "\n";
}
