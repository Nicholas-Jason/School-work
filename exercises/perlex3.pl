#Read each line of the array
#Swap the order of the last name and first name
#Sort the roster by first name
#print roster
$count = 0;
while($student = <STDIN>)
{
    ($last,$first,$id)=split /,/,$student;
    #($last,$first,$id) = ($student =~ /^(.+), (.+),(s.+)/);
    $student= "$first $last $id";
    $roster[$count] = $student;
    $count++;
}
print sort(@roster);
