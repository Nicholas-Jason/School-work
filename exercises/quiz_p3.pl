while($var = <STDIN>)
{
    chomp($var);
    if($var=~ /[Z]+/)
    {
    unshift @uppercase, $var;
    }

}
sort(@uppercase);
foreach $item (@uppercase)
{
    print"$item,\n";
}