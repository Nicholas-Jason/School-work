import java.io.*;
import java.util.*;
public class Dictionary  {
	public static void main(String [] args) throws FileNotFoundException, InputMismatchException
	{
		Wordlist dictionary = new Wordlist();
		dictionary.addFile();
		dictionary.ListHandler();
		
		
		
	}

}
