global class MyWebService {
    webService static Id makeContact(String lastName, Account a) {
        Contact c = new Contact(lastName = 'Weissman', AccountId = a.Id);
        insert c;
        return c.id;
    }
    WebService static Boolean checkcreate(){
    Schema.DescribeSobjectresult   r =  Account.SobjectType.getDescribe();
    Return   r .Iscreateable();
    }

}