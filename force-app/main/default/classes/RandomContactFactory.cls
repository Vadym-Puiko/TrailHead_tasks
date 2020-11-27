public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer amount, String lastName) {
        List<Contact> lists = new List<Contact>();
        for(Integer i = 0; i < amount; i++) {
            lists.add(new Contact(FirstName = 'Test ' + i, LastName=lastName));
        }
        return lists;
    }

}