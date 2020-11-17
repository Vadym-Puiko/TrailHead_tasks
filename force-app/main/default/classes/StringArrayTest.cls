public class StringArrayTest  {
    public static List<String> generateStringArray(Integer amountFields) {
        List<String> arrayString = new List<String>();
        for(Integer i = 0; i < amountFields; i++) {
            arrayString.add('Test ' + i);
        }
        return arrayString;
    }
}