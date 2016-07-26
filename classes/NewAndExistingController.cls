public with sharing class NewAndExistingController {
	public Account account {get; private set;}
	
	public NewAndExistingController(){
		Id id = ApexPages.currentPage().getParameters().get('id');
		account = (id==null)?new Account(): [Select a.Phone, a.Name, a.Industry From Account a where a.id=:id];
	}
	
	public PageReference save(){
		try{
			upsert(account);
		}
		catch(DMLException e){
			ApexPages.addMessages(e);
			
		}
		
		//retrun (new ApexPages.Standardcontroller(account)).view();
		return null;
	}
}