public with sharing class TestMyPage{
     public Boolean showSection1{get;set;}
     public Boolean showSection2{get;set;}            

        public TestMyPage (){
             showSection1= true;
             showSection2= true;
        }

    public void method2(){
         if(showSection2== true){
             showSection2= false;
         }else{
             showSection2= true;
         }      
    }

    public void method1() {
         if(showSection1== true){
             showSection1= false;
         }else{
             showSection1= true;
         }      
    }
}