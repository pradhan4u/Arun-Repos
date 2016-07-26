/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestCleanUpBatchClass {

    static testMethod void test() {
        // The query used by the batch job.
		String query = 'SELECT Id,CreatedDate FROM Merchandise__c ' +
		'WHERE Id NOT IN (SELECT Merchandise__c FROM Line_Item__c)';
		
		// Create some test merchandise items to be deleted
		// by the batch job.
		Merchandise__c[] ml = new List<Merchandise__c>();
		for (Integer i=0;i<10;i++) {
		Merchandise__c m = new Merchandise__c(
		Name='Merchandise ' + i,
		Description__c='Some description',
		Price__c=2,
		Inventory__c=100);
		ml.add(m);
		}
		insert ml;
		Test.startTest();
		CleanUpRecords c=new CleanUpRecords(query);
		Database.executeBatch(c);
		Test.stopTest();
		// Verify merchandise items got deleted
		Integer i = [SELECT COUNT() FROM Merchandise__c];
		System.assertEquals(i, 0);
		
		
    }
}