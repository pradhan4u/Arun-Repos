public with sharing class RandomContactFactory {
	public static List<Contact> generateRandomContacts(integer numberOfContcats, String lastName){
	List<Contact> contacts = new List<Contact>();
	integer i=1;
			while(i<=numberOfContcats){
			contacts.add(new Contact(firstName='Test '+i, lastName=lastName));
			i++;
		}
		return contacts;
	}
}