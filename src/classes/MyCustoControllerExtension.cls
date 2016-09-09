public with sharing class MyCustoControllerExtension {
	private final Account acct;
	
	public MyCustoControllerExtension(ApexPages.StandardController stdController){
		this.acct = (Account)stdController.getRecord();
	}
	
	public String getGreetings(){
		return 'Hello ' + acct.name + ' ('+acct.id +' )';
	}
}