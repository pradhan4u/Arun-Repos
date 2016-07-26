public class AccountHandler {
    public static Account insertNewAccount(String AcccountName){
        Account ac = null;
        if(AcccountName!=null && AcccountName.length()>0){
                    try{
                    ac =new Account(Name=AcccountName);
        insert ac;
        }
        catch(DmlException ex){
            System.debug('Exception occured:'+ex);
        }
        }

        return ac;
    }
}