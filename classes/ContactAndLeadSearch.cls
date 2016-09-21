public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String searchPhrase){
        List<List<sObject>> res = [FIND :searchPhrase IN all FIELDS 
                   RETURNING Contact(FirstName,LastName), Lead(Name)];
        return res;
    }
}