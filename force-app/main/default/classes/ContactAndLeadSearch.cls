public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String searchParam) {
        List<List<sObject>> lists = 
            [FIND :searchParam IN ALL FIELDS RETURNING Lead(FirstName, LastName), Contact(FirstName, LastName)];
        
        return lists;
    }

}