public with sharing class MyController {
        private final Account account;
        public Mycontroller(){
                account = [Select a.Site, a.Name, a.Id From Account a where a.Id=:ApexPages.currentPage().getParameters().get('id')];
        }
        
        public Account getAccount(){
                return this.account;
        }
        
        public PageReference save(){
                update account;
                return null;
        }
}