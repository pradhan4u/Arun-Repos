public with sharing class opportunityList2Con {
	public ApexPages.Standardsetcontroller setCon{
		get{
			if(setCon==null){
				setCon = new ApexPages.Standardsetcontroller(Database.getQueryLocator([SELECT Name, CloseDate FROM Opportunity]));
			}
			return setCon;
		}
		set;
	}
	
	public List<Opportunity> getOpportunities(){
		return (List<Opportunity>)setCon.getRecords();
	}
}