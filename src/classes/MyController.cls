public with sharing class MyController {
    public String myString{get;set;}
    Public String getStringMethod1 (){
        return myString;
    }
    public String getStringMethod2 () {
        if(myString == null)
        myString ='Method2';
        return myString;
    }
}