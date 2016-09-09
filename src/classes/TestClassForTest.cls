@isTest
public class TestClassForTest {
    public static void nonTestMethod(){
        system.debug('@@@@@@@@@@@@@@@@@@@@@@@Just checking');
    }
    @isTest
    static void testMethod1(){
        nonTestMethod();
    }
public static void anotherMethod(){
}
}