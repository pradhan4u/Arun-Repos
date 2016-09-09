trigger AccountAddressTrigger on Account (before insert, before update) {
    //List<Account> acList= Trigger.new;
    System.debug('@@@@@@@@@@@@@@@@@@'+Trigger.new);
    for(Account ac:Trigger.new){
        if(ac.Match_Billing_Address__c){
            ac.ShippingPostalCode = ac.BillingPostalCode;
        }
    }
}