public class MyController2 {
   public Account getAccount() {
       //ApexPages.currentPage().getParameters().put('id','0019000001S7raz');
       String myTestString = 'TestName';
		List<sObject> sobjList = Database.query('SELECT Id, Name, Site FROM Account limit 10');
       return (Account)sobjList[0];
    }
    class innerClass{
        string innerString='Test';
        innerClass(){
            
        }
    }
}