public class StringArrayTest {

    public static List<String> generateStringArray(Integer num){
        List<string> retList = new List<string>();
        String baseText = 'Test ';
        for(Integer i = 0; i < num; i++){
            retList.add(baseText + String.valueOf(i));
        }
        return retList;
    }
    
}