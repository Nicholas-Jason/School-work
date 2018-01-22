#read a file into a variable

open FILE, "<cs371roster.txt";
$roster = do {local $/; <FILE> };

print $roster;

#Read the student ids into @sid array:

@sid = ($roster =~ /(s[0-9]{7})/g);

foreach  $id ( @sid )
{
    print $id, "\n";
}
