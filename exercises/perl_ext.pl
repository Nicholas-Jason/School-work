while($var = <STDIN>)
{
    chomp($var);
    if($var =~/(/w)(1+)/;
    {
	unshift @array, $var;
    }
}

print(@array);