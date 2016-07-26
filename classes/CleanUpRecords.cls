global class CleanUpRecords implements Database.Batchable<Sobject>{
	global final String query;
	global CleanUpRecords(String q){
		query= q;
	}
	global Database.Querylocator start(Database.BatchableContext BC){
		return Database.getQueryLocator(query);
	}
	
	global void execute(Database.BatchableContext BC, List<sObject> scope){
		delete scope;
		Database.emptyRecycleBin(scope);
	}
	
	global void finish(DataBase.BatchableContext BC){
		AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
		TotalJobItems, CreatedBy.Email
		From AsyncApexJob WHERE Id=:BC.getJobId()];
		
		//Send email to Apex Job submitter
		//Notify that the job is complete
		Messaging.Singleemailmessage mail = new Messaging.Singleemailmessage();
		String[] toAddresses = new String[]{a.CreatedBy.Email};
		mail.setToAddresses(toAddresses);
		mail.setSubject('Record Clean Up Status: ' + a.Status);
		mail.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems +' batches with '+ a.NumberOfErrors + ' failures.');
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	}
}