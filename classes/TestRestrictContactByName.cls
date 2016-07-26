@isTest
private class TestRestrictContactByName {
    @isTest static void testInvalidName(){
        Contact c = new Contact(LastName='INVALIDNAME');
        Database.saveResult result = Database.insert(c);
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
		//System.assertEquals('The Last Name "'+'INVALIDNAME'+'" is not allowed for DML', result.getErrors()[0].getMessage());
    }
        @isTest static void testvalidName(){
        Contact c = new Contact(LastName='VALIDNAME');
        Database.saveResult result = Database.insert(c);
        System.assert(result.isSuccess());
    }
}