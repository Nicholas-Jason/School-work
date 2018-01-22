import java.io.*;
import java.util.*;
	public class Wordlist 
	{
		public class Word {
			
			String name = null;
			String definition = "";//keyboard.nextLine();
			public String getDefintion()
			{
				
				return definition;
			}
			
			public String getName(){
				return name;
			}
			
			
			public  Word(String n, String d)
			{
				name = n;
				definition = d;
			}
			
		}
	 ArrayList<Word>list;
	  Scanner keyboard = new Scanner(System.in);
	 File d = new File("dictionary.txt");
	 
	 
	 public Wordlist()
	 {
		 list = new ArrayList<Word>();
	 }
	 
	 public  void addFile() throws FileNotFoundException, NullPointerException
	 {
		 Scanner word = new Scanner(d);
		 
		 while(word.hasNext()) 
		 {
			   String a1 = word.next();
			   String b1 = word.nextLine();
			   list.add(new Word(a1,b1));
		 }
		 word.close();
		 }
		
	
	public  void ListHandler() throws FileNotFoundException{
		System.out.println("Do you wish to access the dictionary?");
		String choice = keyboard.next();
		while(!choice.equalsIgnoreCase("no"))
		{
			System.out.println("Press 1 to list all words and their definitions");
			System.out.println("Press 2 to list definition of a word");
			System.out.println("Press 3 to change the definition of a word");
			System.out.println("Press 4 to add a new word");
			System.out.println("Press 5 to exit the program");
			
			int i = keyboard.nextInt();
			keyboard.nextLine();
			if( i != 5)
			{
				switch(i)
				{
				case(1):
					for(int j = 0; j <list.size();j++)
					{
						System.out.println(list.get(j).getName() + "" + list.get(j).getDefintion());
					}
					break;
				case(2):
					System.out.println("Please type in the name of the word");
					String k = keyboard.nextLine();
					for(int l = 0; l<list.size();l++)
					{
						if(k.equals(list.get(l).getName()))
						{
							System.out.println(list.get(l).getDefintion());
						}
					}
					break;
				case(3):
					System.out.println("Please type in the name of the word");
					String m = keyboard.nextLine();
					for(int l = 0; l<list.size();l++)
					{
						if(m.equals(list.get(l).getName()))
						{
							System.out.println("Please type in the new defintion");
							String n = keyboard.nextLine();
							list.set(l, new Word(m, n));
						}
					}
					break;
				case(4):
					
					System.out.println("Please type in the name of the new word");
					String n1 = keyboard.nextLine();
					System.out.println("Please type in the defintion of the new word");
					String n2 = keyboard.nextLine();
					list.add(new Word(n1,n2));
					break;
				}
			}
			
			else if(i==5)
			{
				PrintStream output  = new PrintStream(d);
				for(int b = 0; b<list.size();b++)
				{
					output.println(list.get(b).getName() + "" + list.get(b).getDefintion());
				}
			    break;
			
			    
			}
			else{
				System.out.println("Please type in a proper number");
			    }
		}
	}
}
	
	
	

