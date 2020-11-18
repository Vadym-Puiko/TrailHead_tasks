public class ContactSearch {
    public static List<Contact> searchForContacts(String lastname, String postalCode) {
        return [SELECT FirstName FROM Contact WHERE LastName=:lastname 
                          AND MailingPostalCode=:postalCode];
    }

}