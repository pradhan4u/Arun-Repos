public class StringArrayTest {
    public static List<String> generateStringArray(integer length){
        List<String> testArray = new List<String>();
        integer i=0;
        while(i<length){
            testArray.add('Test '+i);
            i++;
        }
        return testArray;
    }
}