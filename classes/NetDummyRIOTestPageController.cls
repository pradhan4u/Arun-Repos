public with sharing class NetDummyRIOTestPageController {

    public String accountId {get; set;}
    public String url;
    public String consoleURL{get; set;}
    public NetDummyRIOTestPageController(ApexPages.StandardController controller) {
          consoleURL = 'https://ap1.salesforce.com/500/o';
    }

    public NetDummyRIOTestPageController(){
    }
    
    public Pagereference LoadNetForm(){
        if(accountId != null && accountId != '')
             url= '/'+accountId;
        else
             url = consoleURL;
        
        Pagereference pref = new Pagereference(url);
        pref.getParameters().put('nonce', ApexPages.currentPage().getParameters().get('nonce')); 
        pref.getParameters().put('sfdcIFrameOrigin', ApexPages.currentPage().getParameters().get('sfdcIFrameOrigin')); 
        pref.setRedirect(true);
        return pref;
    }
}