public class ContactSearch {
    public static List<Contact> searchForContacts(String last_name, String postal_code){
        List<Contact> contacts = [Select Name from Contact where (lastName=:last_name and MailingPostalCode=:postal_code)];
        return contacts;
    }
}