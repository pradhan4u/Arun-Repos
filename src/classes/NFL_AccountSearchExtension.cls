public class NFL_AccountSearchExtension {

    public string AccNum {get;set;}
    public string EmailId {get;set;}
    public boolean ShowAccountTable {get;set;}
    public boolean isAccountDateAv{get;set;}
    public List<account> AccountResultSet {get;set;}
    public string SelectedAccId {get;set;}
    public List<case> SelectedAccCases {get;set;}
    public boolean ShowAccountDetail {get;set;}
    public NFL_AccountSearchExtension(ApexPages.StandardController controller) {
        ShowAccountTable = isAccountDateAv = ShowAccountDetail = false;
        AccNum = EmailId  = null;
        AccountResultSet = new List<Account>();
        SelectedAccCases = new List<case>();
    }
    
    public pagereference Submit()
    {
        AccountResultSet.clear();
        SelectedAccCases.clear();
        SelectedAccId =null;
        ShowAccountDetail = false;
        if(AccNum.length() > 0)
        {
            ShowAccountTable = true;
            AccountResultSet = [select id,Email__c,name,accountnumber from account where accountnumber=:AccNum order by createdDate desc ]; 
            // Make a webservice call
            //AccountResultSet = ClassName.MethodName(AccNum);
        }
        if(EmailId.length() > 0)
        {
            ShowAccountTable = true;  
            AccountResultSet = [select id,Email__c,name,accountnumber from account where Email__c=:EmailId order by createdDate desc ];  
            // Make a webservice call
            //AccountResultSet = ClassName.MethodName(EmailId); 
        }
        if(AccountResultSet.size() >0)
        {
            if(AccountResultSet.size() >1)
            {
                isAccountDateAv = true;
            } else 
            {
                ShowAccountDetail = true;
                ShowAccountTable  =true;
                isAccountDateAv = true;
                SelectedAccCases = [select id,casenumber,contact.name,Status,subject,Owner.name,Priority from case where accountid=:SelectedAccId];
                SelectedAccId = AccountResultSet[0].id;
                //PageReference ReturnPage = new PageReference('/' + SelectedAccId); 
                //ReturnPage.setRedirect(false); 
                //return ReturnPage;
            }
        }
        else {
            isAccountDateAv = false;
            ShowAccountDetail = false;
            SelectedAccId = null;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info,'No Record found'));
        }
        return null;
    }
    
    public pagereference  OpenAccountDetail() 
    {
        ShowAccountDetail = true;
        SelectedAccCases.clear();
        SelectedAccId =Apexpages.currentPage().getParameters().get('accid');
        SelectedAccCases = [select id,casenumber,contact.name,Status,subject,Owner.name,Priority from case where accountid=:SelectedAccId];
        
        return null;
    }

}