@isTest
private class MySOSLTestClass {
    public static testMethod void testSoslFixedResults() {
        Contact c = new Contact (firstname='Mike', lastname='Jones', email='mike@jones.com');
        insert c;
        Id [] fixedSearchResults = new Id [] {c.id};
        Test.setFixedSearchResults(fixedSearchResults);
        List<List<Contact>> contacts =(List<List<contact>>) [FIND 'Jones' IN ALL FIELDS RETURNING Contact( Id, firstname,Email)];
        System.assertNotEquals((contacts[0])[0].email,null);
    }
}